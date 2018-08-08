# frozen_string_literal: true

class CreateDocumentKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :document_kinds do |t|
      t.string :title

      t.timestamps
    end
    add_index :document_kinds, :title, unique: true
  end
end
