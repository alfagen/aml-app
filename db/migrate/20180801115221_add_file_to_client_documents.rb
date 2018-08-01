class AddFileToClientDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :client_documents, :file, :string
  end
end
