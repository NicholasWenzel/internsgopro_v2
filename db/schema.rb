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

ActiveRecord::Schema.define(version: 20170120100310) do

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "sector"
    t.binary   "label"
    t.binary   "logo"
    t.binary   "photo"
    t.binary   "video"
    t.string   "descr0_title"
    t.text     "descr0_full"
    t.string   "descr1_title"
    t.text     "descr1_full"
    t.string   "descr2_title"
    t.text     "descr2_full"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "name"
    t.string   "employer"
    t.string   "country"
    t.string   "city"
    t.string   "sector"
    t.date     "posted"
    t.date     "deadline"
    t.integer  "salary"
    t.string   "label"
    t.string   "type"
    t.text     "job_description"
    t.text     "candidate_profile"
    t.text     "organisation_description"
    t.text     "offer"
    t.text     "apply"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "employer_id"
  end

  add_index "offers", ["employer_id"], name: "index_offers_on_employer_id"

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "country"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "employer"
    t.string   "country"
    t.string   "sector"
    t.integer  "salary"
    t.string   "recommendation"
    t.decimal  "score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
