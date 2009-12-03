class Color < ActiveRecord::Base
  default_scope :order => :name

  has_many :cards
  validates_presence_of :name
  validates_uniqueness_of :name

  named_scope :with_cards, {
    :joins => "JOIN cards on cards.color_id = colors.id",
    :select => "DISTINCT colors.*"
  }
end