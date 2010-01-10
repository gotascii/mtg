class AddImageUrlToCards < ActiveRecord::Migration
  def self.up
    add_column :cards, :image_url, :string
  end

  def self.down
    remove_column :cards, :image_url
  end
end