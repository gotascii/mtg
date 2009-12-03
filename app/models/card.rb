class Card < ActiveRecord::Base
  belongs_to :color
  belongs_to :expansion
  validates_presence_of :name, :total

  named_scope :with_color_and_expansion, { :include => [:color, :expansion] }

  named_scope :descend_by_color_name, {
    :joins => :color,
    :order => "colors.name DESC, cards.name ASC"
  }

  named_scope :ascend_by_color_name, {
    :joins => :color,
    :order => "colors.name ASC, cards.name ASC"
  }

  named_scope :descend_by_expansion_abbr, {
    :joins => :expansion,
    :order => "expansions.abbr DESC, cards.name ASC"
  }

  named_scope :ascend_by_expansion_abbr, {
    :joins => :expansion,
    :order => "expansions.name ASC, cards.name ASC"
  }

  def self.search(conds = {})
    conds ||= {}
    super({'order' => 'ascend_by_name'}.merge(conds))
  end

  def titleized_name
    name.titleize
  end

  def url
    "http://magiccards.info/query.php?cardname=#{URI.escape(name)}"
  end
end