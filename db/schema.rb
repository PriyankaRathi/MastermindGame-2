# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140430233603) do

  create_table "colors", force: true do |t|
    t.string   "color_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_colors", force: true do |t|
    t.integer  "game_id",    null: false
    t.integer  "color_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_colors", ["game_id"], name: "index_game_colors_on_game_id"

  create_table "games", force: true do |t|
    t.string   "user",                             null: false
    t.integer  "number_of_guesses", default: 4,    null: false
    t.integer  "color_code_length", default: 4,    null: false
    t.boolean  "allow_duplicates",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guessed_colors", force: true do |t|
    t.integer  "guess_id",   null: false
    t.integer  "color_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guessed_colors", ["guess_id"], name: "index_guessed_colors_on_guess_id"

  create_table "guesses", force: true do |t|
    t.integer  "game_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guesses", ["game_id"], name: "index_guesses_on_game_id"

end
