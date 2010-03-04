class RemoveSideboardIdFromDecks < ActiveRecord::Migration
  def self.up
    remove_column :decks, :sideboard_id
  end

  def self.down
    add_column :decks, :sideboard_id, :integer
  end
end
