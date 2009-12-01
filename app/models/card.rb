class Card < ActiveRecord::Base
  default_scope :order => :name

  belongs_to :color
  belongs_to :expansion
  validates_presence_of :name, :total

  named_scope :order_by_color_name, {
    :include => [:color, :expansion],
    :order => 'colors.name, expansions.abbr, cards.name'
  }

  def titleized_name
    name.titleize
  end

  def url
    "http://magiccards.info/query.php?cardname=#{URI.escape(name)}"
  end
end