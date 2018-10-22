class PasswordsController < ApplicationController
  def edit
    render :edit, locals: { change_password_form: form, user: current_user }
  end

  def update
    current_user.update locale: form.locale
    current_user.change_password! form.password if !form.password.empty? && form.valid?
    flash.now.alert = message
    render :edit, locals: { change_password_form: form }
  end

  private

  def form
    @form ||= ChangePasswordForm.new(params.fetch(:change_password_form, {}).permit(:password,
                                                                                    :password_confirmation,
                                                                                    :current_password,
                                                                                    :locale).merge(user: current_user))
  end

  def message
    form.errors.messages.empty? ? 'Профиль изменен.' : form.errors.messages.to_s
  end
end
