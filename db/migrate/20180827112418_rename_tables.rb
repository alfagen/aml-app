class RenameTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :client_documents, :aml_client_documents
    rename_table :client_document_fields, :aml_client_document_fields
    rename_table :document_kinds, :aml_document_kinds
    rename_table :document_kind_field_definitions, :aml_document_kind_field_definitions
    rename_table :orders, :aml_orders
    rename_table :clients, :aml_clients
    rename_table :users, :aml_users
  end
end
