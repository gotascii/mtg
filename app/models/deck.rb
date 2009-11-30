class Deck < ActiveRecord::Base
  has_many :picks
  validates_presence_of :name
  named_scope :order_by_name, :order => :name
end