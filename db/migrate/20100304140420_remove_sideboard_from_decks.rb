class RemoveSideboardFromDecks < ActiveRecord::Migration
  def self.up
    remove_column :decks, :sideboard
  end

  def self.down
    add_column :decks, :sideboard, :boolean, :default => false
  end
end
