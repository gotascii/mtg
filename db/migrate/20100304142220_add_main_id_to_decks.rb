class AddMainIdToDecks < ActiveRecord::Migration
  def self.up
    add_column :decks, :main_id, :integer
  end

  def self.down
    remove_column :decks, :main_id
  end
end
