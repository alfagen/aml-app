# This migration comes from aml (originally 20181112143348)
class AddNotificationReferencesToStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :aml_notifications, :subject
  end
end
