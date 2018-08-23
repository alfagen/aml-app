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

ActiveRecord::Schema.define(version: 2018_08_23_053550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_document_fields", force: :cascade do |t|
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_document_id"
    t.bigint "document_kind_field_definition_id"
    t.index ["client_document_id", "document_kind_field_definition_id"], name: "client_document_fields_index", unique: true
  end

  create_table "client_documents", force: :cascade do |t|
    t.integer "document_kind_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", null: false
    t.string "workflow_state", default: "pending", null: false
    t.bigint "order_id"
    t.index ["document_kind_id"], name: "index_client_documents_on_document_kind_id"
    t.index ["order_id"], name: "index_client_documents_on_order_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "inn", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_kind_field_definitions", force: :cascade do |t|
    t.string "key", null: false
    t.string "title", null: false
    t.datetime "archived_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "document_kind_id"
    t.index ["document_kind_id"], name: "index_document_kind_field_definitions_on_document_kind_id"
    t.index ["key"], name: "index_document_kind_field_definitions_on_key", unique: true
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
    t.string "workflow_state", default: "none", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.bigint "user_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "workflow_state", default: "unblocked", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "client_document_fields", "client_documents"
  add_foreign_key "client_document_fields", "document_kind_field_definitions"
  add_foreign_key "client_documents", "document_kinds"
  add_foreign_key "client_documents", "orders"
  add_foreign_key "document_kind_field_definitions", "document_kinds"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "users"
end
