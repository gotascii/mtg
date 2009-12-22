class Deck < ActiveRecord::Base
  has_many :picks,  :dependent => :destroy

  before_validation :generate_new_picks
  validate :presence_of_new_pick_cards
  validates_presence_of :name
  after_save :populate_picks

  def total
    picks.sum(:total)
  end

  CardType.all.each do |card_type|
    define_method card_type.sum_method_name do
      self.picks.send(card_type.scope_method_name).sum(:total)
    end
  end

  def card_types_with_picks
    CardType.all.select do |card_type|
      send(card_type.sum_method_name) > 0
    end
  end

  def to_s
    str = returning [] do |str|
      card_types_with_picks.each do |card_type|
        str << "#{card_type.abbr}#{send(card_type.sum_method_name)}"
      end
    end
    str << "T#{total}"
    "#{name.upcase} #{str.join(", ")}"
  end

  def shopping_list
    picks.with_need.wanted.collect do |pick|
      "#{pick.need}x #{pick.card.name}"
    end.join("\n")
  end

  def complete_list
    @complete_list ||= generate_complete_list
  end

  def generate_complete_list
    picks.collect do |pick|
      "#{pick.total}x #{pick.card.name}"
    end.join("\n")
  end

  def complete_list=(val)
    @complete_list = val
  end

  def generate_new_picks
    @new_picks = complete_list.collect do |line|
      line =~ /(\d+)x(.*)/
      total = $1
      name = $2.strip.downcase
      card = Card.find_by_name(name)
      card = Card.new(:name => name) if card.nil?
      Pick.new(:card => card, :total => total, :deck => self)
    end
  end

  def presence_of_new_pick_cards
    @new_picks.each do |p|
      errors.add_to_base "Could not find #{p.card.titleized_name}" unless p.valid?
    end
  end

  def populate_picks
    self.picks = @new_picks if valid?
  end
end