class CardType < ActiveRecord::Base
  default_scope :order => :abbr

  caches_constants

  has_many :cards, :order => 'cards.name'

  validates_presence_of :name, :abbr
  validates_uniqueness_of :abbr

  def scope_method_name
    name.tableize.to_sym
  end

  def sum_method_name
    "#{name.downcase}_total".to_sym
  end
end