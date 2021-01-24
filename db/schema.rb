# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_23_234034) do

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "vacancies"
    t.boolean "wifi"
    t.boolean "breakfast"
    t.string "accessibility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "duration"
    t.string "party_size"
    t.date "start_date"
    t.date "end_date"
    t.integer "room_id", null: false
    t.integer "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["tenant_id"], name: "index_reservations_on_tenant_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "occupancy"
    t.boolean "vacant"
    t.string "room_number"
    t.boolean "smoking"
    t.string "price_per_night"
    t.integer "hotel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "age"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tenants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.string "current_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "tenants"
  add_foreign_key "rooms", "hotels"
  add_foreign_key "tenants", "users"
end
