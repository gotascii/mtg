class Deck < ActiveRecord::Base
  has_many :picks,  :dependent => :destroy
  validates_presence_of :name

  def total
    picks.sum(:total)
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