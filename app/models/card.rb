class Card < ActiveRecord::Base
  attr_accessor :color_ids

  has_many :shades, :dependent => :destroy
  has_many :colors, :through => :shades

  belongs_to :expansion
  validates_presence_of :name, :total

  named_scope :descend_by_expansion_abbr, {
    :joins => :expansion,
    :order => "expansions.abbr DESC, cards.name ASC"
  }

  named_scope :ascend_by_expansion_abbr, {
    :joins => :expansion,
    :order => "expansions.name ASC, cards.name ASC"
  }

  def self.search(conds = {})
    conds ||= {}
    super({'order' => 'ascend_by_name'}.merge(conds))
  end

  def color_ids=(ids)
    self.shades = []
    ids.each do |color_id|
      self.shades.build(:color_id => color_id)
    end
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
end