# This migration comes from aml (originally 20181008120856)
class AddFileToDocumentKind < ActiveRecord::Migration[5.2]
  def change
    add_column :aml_document_kinds, :image, :string
    add_column :aml_document_kinds, :file_title, :string
  end
end
