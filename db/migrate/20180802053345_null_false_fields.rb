# frozen_string_literal: true

class NullFalseFields < ActiveRecord::Migration[5.2]
  def change
    change_column :document_kinds, :title, :string, null: false
    change_column :clients, :name, :string, null: false
    change_column :clients, :inn, :integer, null: false
    change_column :client_documents, :document_kind_id, :integer, null: false
    change_column :client_documents, :client_id, :integer, null: false
    change_column :client_documents, :file, :string, null: false
    change_column :client_documents, :workflow_state, :string, null: false, default: 'pending'
  end
end
