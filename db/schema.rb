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

ActiveRecord::Schema.define(version: 20150910120659) do

  create_table "employees", force: :cascade do |t|
    t.integer  "emp_no",     limit: 4,                   null: false
    t.string   "email",      limit: 255,                 null: false
    t.string   "name",       limit: 255,                 null: false
    t.string   "PAN",        limit: 255
    t.date     "DOJ"
    t.boolean  "isAdmin",                default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "payslips", force: :cascade do |t|
    t.integer  "emp_no",     limit: 4,  null: false
    t.integer  "month",      limit: 4,  null: false
    t.integer  "year",       limit: 4,  null: false
    t.float    "basic",      limit: 24
    t.float    "conveyance", limit: 24
    t.float    "medical",    limit: 24
    t.float    "hra",        limit: 24
    t.float    "bonus",      limit: 24
    t.float    "lta",        limit: 24
    t.float    "fuel",       limit: 24
    t.float    "mobile",     limit: 24
    t.float    "loan",       limit: 24
    t.float    "advance",    limit: 24
    t.float    "tds",        limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
