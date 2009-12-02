class Deck < ActiveRecord::Base
  has_many :picks,  :dependent => :destroy
  validates_presence_of :name

  def total
    picks.collect(&:total).sum
  end

  def wanted_picks
    picks.with_need.select{|p| p.need > 0 }
  end

  def shopping_list
    wanted_picks.collect do |pick|
      "#{pick.need} #{pick.card.titleized_name}"
    end.join("\n")
  end
end