module AML
  class UserMailer < AML::ApplicationMailer
    def reset_password_email(user)
      @url = edit_password_reset_url(user.reset_password_token)
      mail(to: user.email, subject: 'Вы зарегистрированы', template_path: 'aml/user_mailer')
    end
  end
end
