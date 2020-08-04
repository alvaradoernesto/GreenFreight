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

ActiveRecord::Schema.define(version: 2020_08_01_192850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "freights", force: :cascade do |t|
    t.string "start_point"
    t.string "end_point"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "status"
    t.float "price"
    t.float "capacity"
    t.float "distance"
    t.float "emissions"
    t.bigint "truck_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["truck_id"], name: "index_freights_on_truck_id"
  end

  create_table "load_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "freight_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "hour_range"
    t.bigint "load_category_id", null: false
    t.bigint "special_requirement_id", null: false
    t.integer "weight"
    t.integer "volume"
    t.string "status"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["freight_id"], name: "index_loads_on_freight_id"
    t.index ["load_category_id"], name: "index_loads_on_load_category_id"
    t.index ["special_requirement_id"], name: "index_loads_on_special_requirement_id"
    t.index ["user_id"], name: "index_loads_on_user_id"
  end

  create_table "special_requirements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "truck_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "truck_load_categories", force: :cascade do |t|
    t.bigint "truck_id", null: false
    t.bigint "load_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["load_category_id"], name: "index_truck_load_categories_on_load_category_id"
    t.index ["truck_id"], name: "index_truck_load_categories_on_truck_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.float "price_per_km"
    t.float "capacity"
    t.bigint "user_id", null: false
    t.bigint "truck_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "truck_name"
    t.string "driver_name"
    t.string "driver_license"
    t.string "truck_license"
    t.index ["truck_category_id"], name: "index_trucks_on_truck_category_id"
    t.index ["user_id"], name: "index_trucks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "role"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "freights", "trucks"
  add_foreign_key "loads", "freights"
  add_foreign_key "loads", "load_categories"
  add_foreign_key "loads", "special_requirements"
  add_foreign_key "loads", "users"
  add_foreign_key "truck_load_categories", "load_categories"
  add_foreign_key "truck_load_categories", "trucks"
  add_foreign_key "trucks", "truck_categories"
  add_foreign_key "trucks", "users"
end
