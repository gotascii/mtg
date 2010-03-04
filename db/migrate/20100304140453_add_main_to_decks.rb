class AddMainToDecks < ActiveRecord::Migration
  def self.up
    add_column :decks, :main, :boolean, :default => true
  end

  def self.down
    remove_column :decks, :main
  end
end
