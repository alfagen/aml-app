# This migration comes from aml (originally 20181112143621)
class RenameNotificationToNotificationTemplates < ActiveRecord::Migration[5.2]
  def change
    rename_table :aml_notifications, :aml_notification_templates
  end
end
