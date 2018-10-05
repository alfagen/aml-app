# This migration comes from aml (originally 20181004140616)
class RenameDetailsToTitleInRejectReason < ActiveRecord::Migration[5.2]
  def change
    rename_column :aml_reject_reasons, :details, :title
    change_column :aml_reject_reasons, :title, :string

    add_index :aml_reject_reasons, :title, unique: true

    add_column :aml_orders, :reject_reason_details, :text
  end
end
