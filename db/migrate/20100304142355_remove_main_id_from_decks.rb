class RemoveMainIdFromDecks < ActiveRecord::Migration
  def self.up
    remove_column :decks, :main_id
  end

  def self.down
    add_column :decks, :main_id, :integer
  end
end
