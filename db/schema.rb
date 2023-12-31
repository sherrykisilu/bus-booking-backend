# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_03_115339) do
  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_superadmin", default: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "seat_number", null: false
    t.integer "customer_id", null: false
    t.integer "bus_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_bookings_on_bus_id"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
  end

  create_table "buses", force: :cascade do |t|
    t.integer "number_of_seats", null: false
    t.decimal "cost_per_seat", null: false
    t.string "route", null: false
    t.datetime "time_of_travel", precision: nil, null: false
    t.integer "driver_id", null: false
    t.string "registration_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["driver_id"], name: "index_buses_on_driver_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_customers_on_admin_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "registration_number"
    t.string "route"
    t.index ["admin_id"], name: "index_drivers_on_admin_id"
  end

  add_foreign_key "bookings", "buses"
  add_foreign_key "bookings", "customers"
  add_foreign_key "buses", "drivers"
  add_foreign_key "customers", "admins"
  add_foreign_key "drivers", "admins"
end
