# This migration comes from aml (originally 20181022181513)
class AddEmailAndPhoneToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :aml_clients, :email, :string
    add_column :aml_clients, :phone, :string
  end
end
