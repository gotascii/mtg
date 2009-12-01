class Pick < ActiveRecord::Base
  default_scope ({
    :joins => "JOIN cards ON cards.id = picks.card_id JOIN colors ON colors.id = cards.color_id JOIN expansions ON expansions.id = cards.expansion_id",
    :order => 'colors.name, expansions.abbr, cards.name'
  })

  belongs_to :deck
  belongs_to :card

  def diff
    d = total - card.total
    d > 0 ? d : 0
  end
end