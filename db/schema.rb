# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_180_802_070_924) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'client_documents', force: :cascade do |t|
    t.integer 'document_kind_id', null: false
    t.integer 'client_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'file', null: false
    t.string 'workflow_state', default: 'pending', null: false
    t.index %w[client_id document_kind_id], name: 'index_client_documents_on_client_id_and_document_kind_id', unique: true
    t.index ['client_id'], name: 'index_client_documents_on_client_id'
    t.index ['document_kind_id'], name: 'index_client_documents_on_document_kind_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'inn', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'document_kinds', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['title'], name: 'index_document_kinds_on_title', unique: true
  end

  add_foreign_key 'client_documents', 'clients'
  add_foreign_key 'client_documents', 'document_kinds'
end
