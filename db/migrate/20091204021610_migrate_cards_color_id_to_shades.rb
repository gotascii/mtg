class MigrateCardsColorIdToShades < ActiveRecord::Migration
  def self.up
    Card.all.each do |c|
      Shade.create!(:card_id => c.id, :color_id => c.color_id)
    end
  end

  def self.down
    raise 'Nah'
  end
end
