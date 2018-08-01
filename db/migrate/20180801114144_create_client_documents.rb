class CreateClientDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :client_documents do |t|
      t.references :document_kind, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
