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

ActiveRecord::Schema.define(version: 20160327225626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "category",                            null: false
    t.string   "description",                         null: false
    t.decimal  "price",       precision: 8, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_orders", id: false, force: :cascade do |t|
    t.integer "item_id",  null: false
    t.integer "order_id", null: false
  end

  add_index "items_orders", ["item_id", "order_id"], name: "index_items_orders_on_item_id_and_order_id", using: :btree
  add_index "items_orders", ["order_id", "item_id"], name: "index_items_orders_on_order_id_and_item_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "party_name",                   null: false
    t.integer  "party_size",                   null: false
    t.integer  "table_number",                 null: false
    t.boolean  "completed",    default: false
    t.string   "special"
    t.integer  "user_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.string   "role",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end