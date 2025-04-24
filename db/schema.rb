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

ActiveRecord::Schema[8.0].define(version: 2025_04_24_091208) do
  create_table "matches", force: :cascade do |t|
    t.integer "team_a_id", null: false
    t.integer "team_b_id", null: false
    t.datetime "played_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_a_id"], name: "index_matches_on_team_a_id"
    t.index ["team_b_id"], name: "index_matches_on_team_b_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "match_id", null: false
    t.integer "winner_id"
    t.integer "loser_id"
    t.boolean "draw"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_results_on_match_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "points"
    t.integer "rank"
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  add_foreign_key "matches", "teams", column: "team_a_id"
  add_foreign_key "matches", "teams", column: "team_b_id"
  add_foreign_key "players", "teams"
  add_foreign_key "results", "matches"
end
