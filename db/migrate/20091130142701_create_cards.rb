class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.integer :color_id
      t.integer :expansion_id
      t.string :name
      t.integer :total, :default => 0
    end
  end

  def self.down
    drop_table :cards
  end
end