class NotificationMailer < ApplicationMailer
  def notify(user, template_id:, subject:)
    mail(
      to: user.email,
      template_id: template_id,
      subject: subject
    )
  end

  def request_personal_verification(user)
    custom_mail(
      user,
      template_id: 'd-33bc04128a12412a8f8618f44f155584',
      template_data: { name: user.name }
    )
  end

  def request_professional_verification(user)
    custom_mail(
      user,
      template_id: 'd-1d69c71e2ca749bd88f2aaa6a20f93df',
      template_data: { name: user.name }
    )
  end

  def request_declined(user:, reason:)
    custom_mail(
      user,
      template_id: 'd-9e1ed2248cf542f98af8b7dbadf255a1',
      template_data: { name: user.name, reason: reason }
    )
  end

  def personal_approved(user)
    custom_mail(
      user,
      template_id: 'd-dbeb1fd1da684044ba90817037c2a741',
      template_data: { name: user.name }
    )
  end

  def professional_approved(user)
    custom_mail(
      user,
      template_id: 'd-291f0bafdec946b1882a8969ed388456',
      template_data: { name: user.name }
    )
  end
end
