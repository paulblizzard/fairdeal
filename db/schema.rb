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

ActiveRecord::Schema.define(version: 20161026170206) do

  create_table "answers", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "dealing_id"
    t.index ["dealing_id"], name: "index_answers_on_dealing_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "dealings", force: :cascade do |t|
    t.date     "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "status"
  end

  create_table "dealings_factors", id: false, force: :cascade do |t|
    t.integer "dealing_id"
    t.integer "factor_id"
    t.index ["dealing_id"], name: "index_dealings_factors_on_dealing_id"
    t.index ["factor_id"], name: "index_dealings_factors_on_factor_id"
  end

  create_table "factors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "content"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "factor_id"
    t.integer  "answer_id"
    t.index ["answer_id"], name: "index_questions_on_answer_id"
    t.index ["factor_id"], name: "index_questions_on_factor_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "email_pref"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_digest"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string   "isbn"
    t.string   "title"
    t.string   "author"
    t.string   "format"
    t.date     "pub_date"
    t.integer  "pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dealing_id"
    t.index ["dealing_id"], name: "index_works_on_dealing_id"
  end

end
