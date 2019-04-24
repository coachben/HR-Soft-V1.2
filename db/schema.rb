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

ActiveRecord::Schema.define(version: 20190423185551) do

  create_table "account_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "account_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["account_type_id"], name: "index_accounts_on_account_type_id"
  end

  create_table "balances", force: :cascade do |t|
    t.integer  "account_id"
    t.date     "date"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_balances_on_account_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.date     "started_on"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "employments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "worker_id"
    t.integer  "company_id"
  end

  create_table "paychecks", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_paychecks_on_employee_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "worker_id"
    t.decimal  "annual_amount"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.decimal  "allowance",     precision: 10, scale: 2
    t.decimal  "income_tax",    precision: 10, scale: 2
    t.string   "bank_name"
    t.string   "bank_acc_type"
    t.string   "bank_address"
    t.string   "income_tax_no"
    t.decimal  "nhif"
    t.string   "nhif_no"
    t.decimal  "nssf"
    t.string   "nssf_no"
    t.integer  "pay_type"
    t.decimal  "salary",        precision: 10, scale: 2
    t.decimal  "net_salary",    precision: 10, scale: 2
    t.index ["worker_id"], name: "index_salaries_on_worker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "role_id"
    t.boolean  "admin"
    t.boolean  "superadmin_role",        default: false
    t.boolean  "supervisor_role",        default: false
    t.boolean  "user_role",              default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "code"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "emp_mode"
    t.string   "role"
    t.string   "email"
    t.string   "reporting_manager"
    t.string   "job_title"
    t.string   "exprerience"
    t.integer  "tel"
    t.string   "status"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.decimal  "starting_salary",   default: "0.0", null: false
    t.index ["company_id"], name: "index_workers_on_company_id"
  end

end
