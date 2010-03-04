class AddSideboardIdToDecks < ActiveRecord::Migration
  def self.up
    add_column :decks, :sideboard_id, :integer
  end

  def self.down
    remove_column :decks, :sideboard_id
  end
end
