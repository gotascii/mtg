class AddSideboardToPicks < ActiveRecord::Migration
  def self.up
    add_column :picks, :sideboard, :boolean, :default => false
  end

  def self.down
    remove_column :picks, :sideboard
  end
end
