class CreateShades < ActiveRecord::Migration
  def self.up
    create_table :shades do |t|
      t.integer :color_id
      t.integer :card_id
    end
  end

  def self.down
    drop_table :shades
  end
end
