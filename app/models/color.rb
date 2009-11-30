class Color < ActiveRecord::Base
  caches_constants
  has_many :cards
  validates_presence_of :name
  named_scope :order_by_name, :order => :name
  named_scope :with_cards, {
    :joins => "JOIN cards on cards.color_id = colors.id",
    :select => "DISTINCT colors.*"
  }
end