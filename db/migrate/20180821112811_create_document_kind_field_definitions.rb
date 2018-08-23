class CreateDocumentKindFieldDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :document_kind_field_definitions do |t|
      t.string :key, null: false
      t.string :title, null: false
      t.datetime :archived_at

      t.timestamps
    end

    add_reference :document_kind_field_definitions, :document_kind, index: true, foreign_key: true
    add_index :document_kind_field_definitions, [:document_kind_id, :key], unique: true, name: 'document_field_definitions'
  end
end
