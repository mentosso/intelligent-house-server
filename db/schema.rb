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

ActiveRecord::Schema.define(version: 20151129103107) do

  create_table "actuators", force: :cascade do |t|
    t.string   "number",     limit: 255
    t.boolean  "state"
    t.integer  "room_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "actuators", ["room_id"], name: "index_actuators_on_room_id", using: :btree

  create_table "humidity_data", force: :cascade do |t|
    t.decimal  "value",                precision: 10
    t.integer  "sensor_id",  limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "humidity_data", ["sensor_id"], name: "index_humidity_data_on_sensor_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "message",      limit: 255
    t.string   "message_type", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "sqm",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sensors", force: :cascade do |t|
    t.string   "number",     limit: 255
    t.boolean  "state"
    t.integer  "room_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sensors", ["room_id"], name: "index_sensors_on_room_id", using: :btree

  create_table "temperature_data", force: :cascade do |t|
    t.decimal  "value",                precision: 10
    t.integer  "sensor_id",  limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "temperature_data", ["sensor_id"], name: "index_temperature_data_on_sensor_id", using: :btree

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

  add_foreign_key "actuators", "rooms"
  add_foreign_key "humidity_data", "sensors"
  add_foreign_key "sensors", "rooms"
  add_foreign_key "temperature_data", "sensors"
end
