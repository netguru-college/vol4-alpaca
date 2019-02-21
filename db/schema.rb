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

ActiveRecord::Schema.define(version: 2019_02_21_092802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alpaca_events", force: :cascade do |t|
    t.bigint "alpaca_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "winner", default: false, null: false
    t.integer "points", default: 0, null: false
    t.index ["alpaca_id"], name: "index_alpaca_events_on_alpaca_id"
    t.index ["event_id"], name: "index_alpaca_events_on_event_id"
  end

  create_table "alpaca_skills", force: :cascade do |t|
    t.integer "level", null: false
    t.bigint "alpaca_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alpaca_id", "skill_id"], name: "index_alpaca_skills_on_alpaca_id_and_skill_id", unique: true
    t.index ["alpaca_id"], name: "index_alpaca_skills_on_alpaca_id"
    t.index ["skill_id"], name: "index_alpaca_skills_on_skill_id"
  end

  create_table "alpacas", force: :cascade do |t|
    t.string "name", null: false
    t.string "quote", null: false
    t.text "picture_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "gender", null: false
    t.boolean "for_sale"
    t.boolean "busy", default: false, null: false
    t.integer "price", default: 0
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "picture_url"
  end

  create_table "category_skills", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "skill_id"
    t.integer "weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_skills_on_category_id"
    t.index ["skill_id"], name: "index_category_skills_on_skill_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "bid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.bigint "user_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "ownerships", force: :cascade do |t|
    t.bigint "alpaca_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "owner_from", default: "2019-02-20 12:57:02"
    t.datetime "owner_to"
    t.integer "sold_for"
    t.index ["alpaca_id"], name: "index_ownerships_on_alpaca_id"
    t.index ["user_id"], name: "index_ownerships_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.text "avatar_url", default: "https://st3.depositphotos.com/6811030/13096/v/1600/depositphotos_130962816-stock-illustration-cartoon-farmer-or-redneck.jpg"
    t.integer "hay"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alpaca_events", "alpacas"
  add_foreign_key "alpaca_events", "events"
  add_foreign_key "alpaca_skills", "alpacas"
  add_foreign_key "alpaca_skills", "skills"
  add_foreign_key "category_skills", "categories"
  add_foreign_key "category_skills", "skills"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "users"
  add_foreign_key "ownerships", "alpacas"
  add_foreign_key "ownerships", "users"
end
