class Card < ActiveRecord::Base
  belongs_to :color
  belongs_to :expansion
  validates_presence_of :name, :total
  default_scope :order => :name
  named_scope :order_by_name, :order => :name
  named_scope :order_by_color_name, {
    :include => [:color, :expansion],
    :order => 'colors.name, expansions.name, cards.name'
  }

  def titleized_name
    name.titleize
  end

  def url
    "http://magiccards.info/query.php?cardname=#{URI.escape(name)}"
  end
end