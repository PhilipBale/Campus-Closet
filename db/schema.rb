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

ActiveRecord::Schema.define(version: 20150119020138) do

  create_table "clothings", force: :cascade do |t|
    t.string   "clothing_code"
    t.string   "clothing_type"
    t.string   "gender"
    t.string   "color"
    t.string   "size"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "active",        default: true
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "picked_up",   default: false
    t.boolean  "active",      default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "clothing_id"
  end

  add_index "rentals", ["clothing_id"], name: "index_rentals_on_clothing_id"
  add_index "rentals", ["user_id"], name: "index_rentals_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
