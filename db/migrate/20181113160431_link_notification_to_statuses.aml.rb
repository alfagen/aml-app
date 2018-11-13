# This migration comes from aml (originally 20181112145816)
class LinkNotificationToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_reference :aml_statuses, :on_pending_notification, foreign_key: {to_table: :aml_notifications}
    add_reference :aml_statuses, :on_accept_notification, foreign_key: {to_table: :aml_notifications}
    add_reference :aml_statuses, :on_reject_notification, foreign_key: {to_table: :aml_notifications}
  end
end
