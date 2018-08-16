class InnToString < ActiveRecord::Migration[5.2]
  def change
    change_column :clients, :inn, :string, null: false
  end
end
