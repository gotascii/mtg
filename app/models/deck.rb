class Deck < ActiveRecord::Base
  default_scope :order => :name

  has_many :picks, :include => :card, :dependent => :destroy
  validates_presence_of :name
  named_scope :order_by_name, :order => :name

  def total
    picks.collect(&:total).sum
  end

  def wanted_picks
    picks.select{|p| p.diff > 0 }
  end

  def shopping_list
    wanted_picks.collect do |pick|
      "#{pick.diff} #{pick.card.titleized_name}"
    end.join("\n")
  end
end