# This migration comes from aml (originally 20181105075403)
class AddRiskCategoryToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :aml_clients, :risk_category, :char
  end
end
