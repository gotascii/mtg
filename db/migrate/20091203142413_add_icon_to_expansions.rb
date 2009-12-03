class AddIconToExpansions < ActiveRecord::Migration
  def self.up
    add_column :expansions, :icon, :string
  end

  def self.down
    remove_column :expansions, :icon
  end
end
