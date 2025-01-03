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

ActiveRecord::Schema[8.0].define(version: 2024_12_22_182232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "title", null: false
    t.decimal "amount", null: false
    t.string "currency", default: "USD"
    t.bigint "payer_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_bills_on_group_id"
    t.index ["payer_id"], name: "index_bills_on_payer_id"
  end

  create_table "group_memberships", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_memberships_on_group_id"
    t.index ["user_id"], name: "index_group_memberships_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["creator_id"], name: "index_groups_on_creator_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "payer_id", null: false
    t.bigint "receiver_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bill_id", null: false
    t.index ["bill_id"], name: "index_payments_on_bill_id"
    t.index ["payer_id"], name: "index_payments_on_payer_id"
    t.index ["receiver_id"], name: "index_payments_on_receiver_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bills", "groups"
  add_foreign_key "bills", "users", column: "payer_id"
  add_foreign_key "group_memberships", "groups"
  add_foreign_key "group_memberships", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "groups", "users", column: "creator_id"
  add_foreign_key "payments", "bills"
  add_foreign_key "payments", "users", column: "payer_id"
  add_foreign_key "payments", "users", column: "receiver_id"
end
