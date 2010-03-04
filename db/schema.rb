# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100304143244) do

  create_table "card_types", :force => true do |t|
    t.string "name"
    t.string "abbr"
  end

  create_table "cards", :force => true do |t|
    t.integer "expansion_id"
    t.string  "name"
    t.integer "total",        :default => 0
    t.integer "card_type_id"
    t.string  "image_url"
    t.integer "cmc"
  end

  create_table "colors", :force => true do |t|
    t.string "name"
    t.string "abbr"
  end

  create_table "decks", :force => true do |t|
    t.string  "name"
    t.integer "main_id"
  end

  create_table "expansions", :force => true do |t|
    t.string "name"
    t.string "abbr"
    t.string "icon"
  end

  create_table "picks", :force => true do |t|
    t.integer "deck_id"
    t.integer "card_id"
    t.integer "total",   :default => 4
  end

  create_table "shades", :force => true do |t|
    t.integer "color_id"
    t.integer "card_id"
  end

end
