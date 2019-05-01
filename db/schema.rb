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

ActiveRecord::Schema.define(version: 2019_05_01_001858) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.decimal "budget"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accountable_type"
    t.integer "accountable_id"
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end


  create_table "actuals", force: :cascade do |t|
    t.string "expense"
    t.decimal "cost"
    t.string "payment_information"
    t.integer "post_travel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_travel_id"], name: "index_actuals_on_post_travel_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.string "name"
    t.string "bid"
    t.string "department"
    t.decimal "dmoney"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer "budget_id"
    t.string "did"
    t.string "dname"
    t.decimal "dbudget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_departments_on_budget_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "eid"
    t.string "department"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expects", force: :cascade do |t|
    t.string "expected_expenses"
    t.decimal "expected_costs"
    t.string "payment_information"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_expects_on_request_id"

  create_table "expected_costs", force: :cascade do |t|
    t.integer "request_id"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_expected_costs_on_request_id"
  end

  create_table "expected_expenses", force: :cascade do |t|
    t.integer "request_id"
    t.integer "expense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "expected_expenses"
    t.string "payment_informations"
    t.index ["request_id"], name: "index_expected_expenses_on_request_id"
  end

  create_table "payment_informations", force: :cascade do |t|
    t.integer "request_id"
    t.string "payment_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_payment_informations_on_request_id"

  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.string "pid"
    t.string "department"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_travels", force: :cascade do |t|
    t.string "name"
    t.string "destination"
    t.date "start_date"
    t.date "end_date"
    t.text "purpose"
    t.string "receipts_url"
    t.decimal "expected_expenses"
    t.decimal "actual_expenses"
    t.string "receipt"
    t.text "payment_infomation"
    t.string "notes"
    t.string "budget_status"
    t.string "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "destination"
    t.date "start_date"
    t.date "end_date"
    t.string "reasoning"

    t.integer "field_num"
    t.string "expected_expenses"
    t.decimal "expected_costs"
    t.string "payment_information"
    t.string "budget_name"
    t.string "expected_expenses2"
    t.decimal "expected_costs2"
    t.string "payment_information2"
    t.string "budget_name2"
    t.string "expected_expenses3"
    t.decimal "expected_costs3"
    t.string "payment_information3"
    t.string "budget_name3"

    t.string "employ_department"
    t.string "budget_department"

    t.string "purpose"
    t.string "status"
    t.decimal "total_costs"
    t.integer "employee_id"
    t.integer "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_requests_on_budget_id"
    t.index ["employee_id"], name: "index_requests_on_employee_id"
  end

  create_table "super_accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
