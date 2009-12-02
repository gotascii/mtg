class Pick < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card, :include => [:color, :expansion]

  named_scope :with_need, {
    :select => "picks.*, MAX(0, (picks.total - cards.total)) AS need",
    :joins => :card
  }
  named_scope :descend_by_need, :order => "need DESC, cards.name ASC"
  named_scope :ascend_by_need, :order => "need ASC, cards.name ASC"
  def self.search(conds = {})
    conds ||= {}
    super({'order' => 'ascend_by_card_name'}.merge(conds))
  end

  def need
    attributes["need"].to_i > 0 ? attributes["need"] : 0
  end
end