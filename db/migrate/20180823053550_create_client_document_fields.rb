class CreateClientDocumentFields < ActiveRecord::Migration[5.2]
  def change
    create_table :client_document_fields do |t|
      t.string :value, null: false

      t.timestamps
    end

    add_reference :client_document_fields, :client_document, index: false, foreign_key: true
    add_reference :client_document_fields, :document_kind_field_definition, index: false, foreign_key: true
    add_index :client_document_fields, [:client_document_id, :document_kind_field_definition_id], unique: true, name: 'client_document_fields_index'
  end
end
