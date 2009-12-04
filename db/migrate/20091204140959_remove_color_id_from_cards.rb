class RemoveColorIdFromCards < ActiveRecord::Migration
  def self.up
    remove_column :cards, :color_id
  end

  def self.down
    raise 'nah'
  end
end
