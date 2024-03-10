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

ActiveRecord::Schema[7.1].define(version: 2024_03_10_071510) do
  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers_routes", id: false, force: :cascade do |t|
    t.integer "driver_id", null: false
    t.integer "route_id", null: false
    t.index ["driver_id"], name: "index_drivers_routes_on_driver_id"
    t.index ["route_id"], name: "index_drivers_routes_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "number"
    t.string "customer_type"
    t.string "coverage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "arrival"
    t.string "departure"
    t.integer "route_id", null: false
    t.integer "stop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_schedules_on_route_id"
    t.index ["stop_id"], name: "index_schedules_on_stop_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.string "street"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "drivers_routes", "drivers"
  add_foreign_key "drivers_routes", "routes"
  add_foreign_key "schedules", "routes"
  add_foreign_key "schedules", "stops"
end
