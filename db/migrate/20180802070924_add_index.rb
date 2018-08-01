class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :client_documents, [:client_id, :document_kind_id], unique: true
  end
end
