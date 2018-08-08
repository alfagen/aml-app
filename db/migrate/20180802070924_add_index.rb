# frozen_string_literal: true

class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :client_documents, %i[client_id document_kind_id], unique: true
  end
end
