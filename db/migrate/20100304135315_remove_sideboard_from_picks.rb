class RemoveSideboardFromPicks < ActiveRecord::Migration
  def self.up
    remove_column :picks, :sideboard
  end

  def self.down
    add_column :picks, :sideboard, :boolean, :default => false
  end
end
