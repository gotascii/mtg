class Expansion < ActiveRecord::Base
  caches_constants :key => :abbr
  validates_presence_of :name, :abbr
  named_scope :order_by_name, :order => :name
end