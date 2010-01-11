class Expansion < ActiveRecord::Base
  default_scope :order => :abbr
  validates_presence_of :name, :abbr
  validates_uniqueness_of :abbr

  def self.none
    find_by_name("None")
  end
end