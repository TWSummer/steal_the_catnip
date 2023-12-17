# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_17_211949) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.string "ability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "side"
  end

  create_table "game_players", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_players_on_game_id"
    t.index ["user_id"], name: "index_game_players_on_user_id"
  end

  create_table "game_rounds", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "location_id"
    t.integer "round_number"
    t.integer "thief_player_id"
    t.integer "defender_player_id"
    t.string "thief_plan"
    t.string "defender_plan"
    t.boolean "catnip_stolen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "result"
    t.boolean "thief_next_round"
    t.boolean "defender_next_round"
    t.index ["defender_player_id"], name: "index_game_rounds_on_defender_player_id"
    t.index ["game_id"], name: "index_game_rounds_on_game_id"
    t.index ["location_id"], name: "index_game_rounds_on_location_id"
    t.index ["thief_player_id"], name: "index_game_rounds_on_thief_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "room_code", null: false
    t.boolean "single_player", null: false
    t.integer "squad_size", null: false
    t.integer "round_length", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_code"], name: "index_games_on_room_code", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "round_cats", force: :cascade do |t|
    t.bigint "game_round_id"
    t.bigint "cat_id"
    t.string "side"
    t.boolean "chosen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_round_cats_on_cat_id"
    t.index ["game_round_id"], name: "index_round_cats_on_game_round_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

end
