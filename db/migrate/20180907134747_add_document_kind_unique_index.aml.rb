# This migration comes from aml (originally 20180831101429)
class AddDocumentKindUniqueIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :aml_client_documents, [:order_id, :document_kind_id], unique: true
  end
end
