class AddRolesAndRenameFile < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer, null: false, default: 0
    rename_column :client_documents, :file, :image
  end
end
