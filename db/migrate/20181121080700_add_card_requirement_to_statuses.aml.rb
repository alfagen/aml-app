# This migration comes from aml (originally 20181121060549)
class AddCardRequirementToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :aml_statuses, :card_required, :boolean, null: false, default: false
    add_column :aml_orders, :card_image, :string
  end
end
