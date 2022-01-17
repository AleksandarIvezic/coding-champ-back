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

ActiveRecord::Schema.define(version: 2022_01_17_203742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text "name"
    t.text "icon"
    t.text "info"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "category_id"
    t.text "difficulty"
    t.text "text"
    t.text "answer_1"
    t.text "answer_2"
    t.text "answer_3"
    t.text "answer_4"
    t.text "correct"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["category_id"], name: "idx_16791_index_questions_on_category_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "top_score"
    t.bigint "user_id"
    t.bigint "category_id"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["user_id"], name: "idx_16776_index_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email", default: "", null: false
    t.text "image"
    t.boolean "admin"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questions", "categories", name: "questions_category_id_fkey"
  add_foreign_key "scores", "users", name: "scores_user_id_fkey"
end
