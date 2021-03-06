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

ActiveRecord::Schema.define(version: 20151112180446) do

  create_table "desserts", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.text     "description"
    t.decimal  "retail_price",         precision: 10, scale: 2
    t.decimal  "wholesale_price",      precision: 10, scale: 2
    t.integer  "desserts_category_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "desserts", ["desserts_category_id"], name: "index_desserts_on_desserts_category_id"

  create_table "desserts_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_admin"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
