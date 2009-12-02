class Pick < ActiveRecord::Base
  default_scope ({
    :joins => "JOIN cards ON cards.id = picks.card_id",
    :order => 'cards.name'
  })

  belongs_to :deck
  belongs_to :card, :include => [:color, :expansion]

  def diff
    d = total - card.total
    d > 0 ? d : 0
  end
end