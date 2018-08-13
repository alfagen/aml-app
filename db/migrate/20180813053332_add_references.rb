class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :client, index: true, foreign_key: true
    add_reference :client_documents, :order, index: true, foreign_key: true
  end
end
