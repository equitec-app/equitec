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

ActiveRecord::Schema.define(version: 2018_08_08_205657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
    t.index ["employee_id"], name: "index_accounts_on_employee_id"
  end

  create_table "agreements", force: :cascade do |t|
    t.date "end_date"
    t.date "beginning_date"
    t.integer "agreement_type"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_agreements_on_customer_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "visit_id"
    t.integer "maintenanse_voucher_id"
    t.string "maintenanse_voucher_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visit_id"], name: "index_appointments_on_visit_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_assignments_on_employee_id"
    t.index ["visit_id"], name: "index_assignments_on_visit_id"
  end

  create_table "choosed_power_plants", force: :cascade do |t|
    t.bigint "visit_request_id"
    t.bigint "power_plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["power_plant_id"], name: "index_choosed_power_plants_on_power_plant_id"
    t.index ["visit_request_id"], name: "index_choosed_power_plants_on_visit_request_id"
  end

  create_table "choosed_ups", force: :cascade do |t|
    t.bigint "visit_request_id"
    t.bigint "up_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["up_id"], name: "index_choosed_ups_on_up_id"
    t.index ["visit_request_id"], name: "index_choosed_ups_on_visit_request_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "nit"
    t.string "phone"
    t.string "principal_direction"
    t.string "legal_agent"
    t.string "legal_agent_phone"
    t.string "legal_agent_mail"
    t.string "mainteance_agent"
    t.string "mainteance_phone"
    t.string "payments_manager"
    t.string "payments_phone"
    t.string "payments_mail"
    t.string "cost_center"
    t.bigint "employee_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["employee_id"], name: "index_customers_on_employee_id"
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["username"], name: "index_customers_on_username", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "role"
    t.string "phone"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
    t.index ["username"], name: "index_employees_on_username", unique: true
  end

  create_table "headquarters", force: :cascade do |t|
    t.string "direction"
    t.string "phone"
    t.string "admin"
    t.string "admin_phone"
    t.string "admin_email"
    t.string "city"
    t.string "code"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_headquarters_on_customer_id"
  end

  create_table "power_plants", force: :cascade do |t|
    t.string "trademark"
    t.string "model"
    t.string "capacity"
    t.string "serial"
    t.string "engine_trademark"
    t.string "generator_trademark"
    t.string "control_panel_trademark"
    t.string "engine_model"
    t.string "generator_model"
    t.string "control_panel_model"
    t.string "engine_serial"
    t.string "generator_serial"
    t.string "plate"
    t.float "fuel_tank_capacity"
    t.bigint "headquarter_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_power_plants_on_customer_id"
    t.index ["headquarter_id"], name: "index_power_plants_on_headquarter_id"
  end

  create_table "ups", force: :cascade do |t|
    t.string "trademark"
    t.string "plate"
    t.string "model"
    t.string "serial"
    t.float "power"
    t.integer "number_of_batteries"
    t.integer "type_of_batteries"
    t.bigint "headquarter_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_ups_on_customer_id"
    t.index ["headquarter_id"], name: "index_ups_on_headquarter_id"
  end

  create_table "visit_requests", force: :cascade do |t|
    t.bigint "headquarter_id"
    t.bigint "employee_id"
    t.integer "money_state"
    t.integer "supplie_state"
    t.float "requested_money"
    t.text "requested_supplies"
    t.integer "concept"
    t.text "comment"
    t.boolean "oil_filter"
    t.boolean "oil"
    t.boolean "air_filter"
    t.boolean "fuel_filter"
    t.boolean "water_filter"
    t.boolean "coolant"
    t.boolean "battery"
    t.boolean "fuel"
    t.boolean "mechanical_fail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_visit_requests_on_employee_id"
    t.index ["headquarter_id"], name: "index_visit_requests_on_headquarter_id"
  end

  create_table "visits", force: :cascade do |t|
    t.date "visit_date"
    t.time "visit_start_time"
    t.time "visit_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visit_request_id"
    t.index ["visit_request_id"], name: "index_visits_on_visit_request_id"
  end

  add_foreign_key "accounts", "customers"
  add_foreign_key "accounts", "employees"
  add_foreign_key "agreements", "customers", on_delete: :cascade
  add_foreign_key "appointments", "visits", on_delete: :cascade
  add_foreign_key "assignments", "employees", on_delete: :cascade
  add_foreign_key "assignments", "visits", on_delete: :cascade
  add_foreign_key "choosed_power_plants", "power_plants"
  add_foreign_key "choosed_power_plants", "visit_requests"
  add_foreign_key "choosed_ups", "ups"
  add_foreign_key "choosed_ups", "visit_requests"
  add_foreign_key "customers", "employees"
  add_foreign_key "headquarters", "customers", on_delete: :cascade
  add_foreign_key "power_plants", "customers", on_delete: :cascade
  add_foreign_key "power_plants", "headquarters", on_delete: :cascade
  add_foreign_key "ups", "customers", on_delete: :cascade
  add_foreign_key "ups", "headquarters", on_delete: :cascade
  add_foreign_key "visit_requests", "employees"
  add_foreign_key "visit_requests", "headquarters"
  add_foreign_key "visits", "visit_requests"
end
