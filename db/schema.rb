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

ActiveRecord::Schema.define(version: 2020_06_17_135846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["title"], name: "index_categories_on_title", unique: true
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "question_ids", default: [], array: true
    t.integer "current_streak", default: 0
    t.integer "max_streak", default: 0
    t.integer "current_incorrect_streak", default: 0
    t.integer "max_incorrect_streak", default: 0
    t.string "user_answers", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_ids"], name: "index_games_on_question_ids"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "body", null: false
    t.string "type"
    t.string "choices", default: [], null: false, array: true
    t.string "correct_answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_taggings_on_category_id"
    t.index ["question_id"], name: "index_taggings_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.string "role", default: "standard"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["password_digest"], name: "index_users_on_password_digest", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

end
