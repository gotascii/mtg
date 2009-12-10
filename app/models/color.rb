class Color < ActiveRecord::Base
  default_scope :order => :name

  has_many :shades
  has_many :cards, :through => :shades

  validates_presence_of :name
  validates_uniqueness_of :name

  named_scope :with_shades, {
    :joins => "JOIN shades on shades.color_id = colors.id",
    :select => "DISTINCT colors.*"
  }

  def icon
    "#{name.downcase}.png"
  end
end