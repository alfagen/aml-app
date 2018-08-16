class RemoveReference < ActiveRecord::Migration[5.2]
  def change
    remove_reference :client_documents, :client, index: true, foreign_key: true
  end
end
