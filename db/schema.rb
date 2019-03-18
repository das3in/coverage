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

ActiveRecord::Schema.define(version: 2019_03_18_185709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_leagues_on_slug", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.integer "home_team_score", default: 0
    t.integer "away_team_score", default: 0
    t.integer "round", default: 0
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.boolean "current"
    t.string "day", default: "Friday"
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.bigint "winner_id"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
    t.index ["winner_id"], name: "index_matches_on_winner_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "content"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day", default: "Friday"
    t.index ["tournament_id"], name: "index_microposts_on_tournament_id"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.string "description"
    t.text "body"
    t.boolean "draft", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_id"
    t.bigint "user_id"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
    t.index ["tournament_id"], name: "index_posts_on_tournament_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "predictions", force: :cascade do |t|
    t.bigint "match_id"
    t.float "home_team_guess", default: 0.0
    t.float "away_team_guess", default: 0.0
    t.bigint "winner_guess_id"
    t.boolean "correct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_predictions_on_match_id"
    t.index ["winner_guess_id"], name: "index_predictions_on_winner_guess_id"
  end

  create_table "rating_changes", force: :cascade do |t|
    t.bigint "team_id"
    t.integer "old_rating"
    t.integer "new_rating"
    t.bigint "match_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_rating_changes_on_match_id"
    t.index ["team_id"], name: "index_rating_changes_on_team_id"
    t.index ["tournament_id"], name: "index_rating_changes_on_tournament_id"
  end

  create_table "registered_teams", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.float "margin", default: 0.0
    t.index ["team_id"], name: "index_registered_teams_on_team_id"
    t.index ["tournament_id"], name: "index_registered_teams_on_tournament_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "location"
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_pbsn_rating", default: 1500
    t.integer "current_coaches_poll"
    t.integer "current_nxl_rank"
    t.index ["slug"], name: "index_teams_on_slug", unique: true
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.bigint "league_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "current_day", default: "Friday"
    t.index ["league_id"], name: "index_tournaments_on_league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "slug"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "matches", "registered_teams", column: "away_team_id"
  add_foreign_key "matches", "registered_teams", column: "home_team_id"
  add_foreign_key "matches", "registered_teams", column: "winner_id"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "microposts", "tournaments"
  add_foreign_key "microposts", "users"
  add_foreign_key "posts", "tournaments"
  add_foreign_key "posts", "users"
  add_foreign_key "predictions", "matches"
  add_foreign_key "predictions", "teams", column: "winner_guess_id"
  add_foreign_key "rating_changes", "matches"
  add_foreign_key "rating_changes", "teams"
  add_foreign_key "rating_changes", "tournaments"
  add_foreign_key "registered_teams", "teams"
  add_foreign_key "registered_teams", "tournaments"
  add_foreign_key "tournaments", "leagues"
end
