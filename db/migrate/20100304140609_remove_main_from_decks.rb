class RemoveMainFromDecks < ActiveRecord::Migration
  def self.up
    remove_column :decks, :main
  end

  def self.down
    add_column :decks, :main, :boolean, :default => false
  end
end
