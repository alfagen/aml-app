# This migration comes from aml (originally 20181001092532)
class AddAcceptedAMLStatusToClients < ActiveRecord::Migration[5.2]
  def change
    add_reference :aml_clients, :aml_accepted_order,  foreign_key: {to_table: :aml_orders}
  end
end
