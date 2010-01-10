class Card < ActiveRecord::Base
  attr_accessor :color_ids, :magiccard

  has_many :shades, :dependent => :destroy
  has_many :colors, :through => :shades

  belongs_to :card_type
  belongs_to :expansion
  validates_presence_of :name, :total
  validates_uniqueness_of :name
  validate :presence_of_magiccard, :on => :create

  named_scope :descend_by_expansion_abbr, {
    :joins => :expansion,
    :order => "expansions.abbr DESC, cards.name ASC"
  }

  named_scope :ascend_by_expansion_abbr, {
    :joins => :expansion,
    :order => "expansions.name ASC, cards.name ASC"
  }

  named_scope :descend_by_card_type_abbr, {
    :joins => :card_type,
    :order => "card_types.abbr DESC, cards.name ASC"
  }

  named_scope :ascend_by_card_type_abbr, {
    :joins => :card_type,
    :order => "card_types.name ASC, cards.name ASC"
  }

  named_scope :include_associations, :include => [:expansion, :card_type, :colors]

  before_validation_on_create :populate_magiccard
  after_create :populate_info

  def name=(val)
    self[:name] = val.downcase
  end

  def self.search(conds = {})
    conds ||= {}
    super({'order' => 'ascend_by_name'}.merge(conds))
  end

  def color_ids=(ids)
    new_shades = ids.collect do |color_id|
      Shade.new(:color_id => color_id, :card_id => self.id)
    end
    self.shades = new_shades
  end

  def color_ids
    shades.collect(&:color_id)
  end

  def titleized_name
    name.titleize
  end

  def url
    "http://magiccards.info/query.php?cardname=#{URI.escape(name)}"
  end

  private
  def populate_info
    self.cmc = magiccard.cmc
    self.image_url = magiccard.image_url
    populate_colors if colors.empty?
    populate_expansion if expansion.nil?
    populate_type if card_type.nil?
    save
  end

  def populate_colors
    magiccard.colors.each do |abbr|
      color = Color.find_by_abbr(abbr)
      self.colors << color unless color.nil?
    end
  end
  
  def populate_expansion
    exp = Expansion.find_by_name(magiccard.expansion)
    self.expansion = exp unless exp.nil?
  end

  def populate_type
    self.card_type = CardType.find_by_name(magiccard.type)
  end

  def populate_magiccard
    @magiccard = Magiccards.new(name)
  end

  def presence_of_magiccard
    errors.add(:magiccard, "could not be found") unless magiccard.found?
  end
end