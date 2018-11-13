class NotificationMailer < ApplicationMailer
  def notify(aml_client, notification, data: {})
    notification_template = notification.notification_templates.find_by(locale: aml_client.locale)

    return unless notification_template.present? && notification_template.template_id.present?

    custom_mail(
      email:       aml_client.email,
      template_id: notification_template.template_id,
      data:        data.merge(name: aml_client.first_name)
    )
  end

  private

  def custom_mail(email:, template_id:, data: {})
    mail(
      to:          email,
      template_id: template_id,
      dynamic_template_data: data,

      # Чтобы sendgrid принял нужно хоть что-то передавать,
      # а если ничего не передавать, то запускается render
      body: 'dummy'
    )
  end
end
