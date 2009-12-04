class Shade < ActiveRecord::Base
  belongs_to :color
  belongs_to :card
  
  validates_presence_of :color_id
  validates_presence_of :card_id
end