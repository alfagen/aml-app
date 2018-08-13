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

ActiveRecord::Schema.define(version: 2018_08_13_160948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_documents", force: :cascade do |t|
    t.integer "document_kind_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file", null: false
    t.string "workflow_state", default: "pending", null: false
    t.bigint "order_id"
    t.index ["client_id", "document_kind_id"], name: "index_client_documents_on_client_id_and_document_kind_id", unique: true
    t.index ["client_id"], name: "index_client_documents_on_client_id"
    t.index ["document_kind_id"], name: "index_client_documents_on_document_kind_id"
    t.index ["order_id"], name: "index_client_documents_on_order_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "inn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_kinds", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_document_kinds_on_title", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "surname", null: false
    t.string "patronymic", null: false
    t.datetime "birth_date", null: false
    t.string "workflow_state", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "workflow_state", default: "unblocked", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "password_changed", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "client_documents", "clients"
  add_foreign_key "client_documents", "document_kinds"
  add_foreign_key "client_documents", "orders"
  add_foreign_key "orders", "clients"
end
