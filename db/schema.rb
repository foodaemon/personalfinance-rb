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

ActiveRecord::Schema.define(version: 20130602040004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenance_histories", force: true do |t|
    t.integer  "vehicle_id"
    t.integer  "mileage"
    t.string   "item"
    t.string   "item_description"
    t.date     "maintenance_date"
    t.string   "repair_shop"
    t.string   "repair_shop_location"
    t.string   "repair_shop_phone"
    t.float    "maintenance_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.date     "date"
    t.string   "description"
    t.integer  "category_id"
    t.float    "amount"
    t.boolean  "is_income"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "is_locked"
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: true do |t|
    t.date     "year"
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.string   "transmission"
    t.string   "license_plate_number"
    t.string   "vin"
    t.string   "purchase_date"
    t.integer  "purchase_mileage"
    t.string   "purchased_from"
    t.text     "purchase_detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
