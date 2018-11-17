class UserMailer < AML::ApplicationMailer
  layout 'mailer'

  def reset_password_email(user)
    @url = edit_password_reset_url(user.reset_password_token)
    mail(to: user.email, subject: 'Вы зарегистрированы')
  end
end
