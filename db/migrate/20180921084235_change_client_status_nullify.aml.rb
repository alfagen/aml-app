# This migration comes from aml (originally 20180921082824)
class ChangeClientStatusNullify < ActiveRecord::Migration[5.2]
  def change
    AML::Client.update_all aml_status_id: AML::Status.first.id if AML::Client.any?
    change_column_null :aml_clients, :aml_status_id, false
  end
end
