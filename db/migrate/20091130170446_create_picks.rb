class CreatePicks < ActiveRecord::Migration
  def self.up
    create_table :picks do |t|
      t.integer :deck_id
      t.integer :card_id
      t.integer :total, :default => 4
    end
  end

  def self.down
    drop_table :picks
  end
end
