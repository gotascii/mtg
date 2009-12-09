class Pick < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card

  named_scope :with_need, {
    :select => "picks.*, MAX(0, (picks.total - cards.total)) AS need",
    :joins => :card
  }
  named_scope :wanted, :conditions => ["need > 0"]

  CardType.all.each do |card_type|
    named_scope card_type.scope_method_name, {
      :joins => :card,
      :conditions => ["cards.card_type_id = ?", card_type.id]
    }
  end

  named_scope :descend_by_need, :order => "need DESC, cards.name ASC"
  named_scope :ascend_by_need, :order => "need ASC, cards.name ASC"

  def need
    attributes["need"].to_i
  end

  def self.search(conds = {})
    conds ||= {}
    super({'order' => 'ascend_by_card_name'}.merge(conds))
  end
end