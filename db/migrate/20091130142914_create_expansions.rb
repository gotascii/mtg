class CreateExpansions < ActiveRecord::Migration
  def self.up
    create_table :expansions do |t|
      t.string :name
      t.string :abbr
    end
  end

  def self.down
    drop_table :expansions
  end
end