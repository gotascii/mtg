class AddAbbrToColors < ActiveRecord::Migration
  def self.up
    add_column :colors, :abbr, :string
  end

  def self.down
    remove_column :colors, :abbr
  end
end
