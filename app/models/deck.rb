class Deck < ActiveRecord::Base
  has_many :picks,  :dependent => :destroy
  validates_presence_of :name

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
      "#{pick.need} #{pick.card.name}"
    end.join("\n")
  end

  def complete_list
    picks.collect do |pick|
      "#{pick.total} #{pick.card.name}"
    end.join("\n")
  end

end