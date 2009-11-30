class Pick < ActiveRecord::Base
  belongs_to :deck
  belongs_to :card

  def diff
    d = total - card.total
    d > 0 ? d : 0
  end
end