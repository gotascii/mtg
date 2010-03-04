class AddSideboardToDecks < ActiveRecord::Migration
  def self.up
    add_column :decks, :sideboard, :boolean, :default => false
  end

  def self.down
    remove_column :decks, :sideboard
  end
end
