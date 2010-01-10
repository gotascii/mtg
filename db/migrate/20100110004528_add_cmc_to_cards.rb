class AddCmcToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :cmc, :integer
  end

  def self.down
    remove_column :cards, :cmc
  end
end
