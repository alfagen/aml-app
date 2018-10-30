# This migration comes from aml (originally 20181030155828)
class AddRiskToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :aml_clients, :risk, :integer, default: 0
    execute "update aml_clients set risk=0"
    change_column_null :aml_clients, :risk, false
  end
end
