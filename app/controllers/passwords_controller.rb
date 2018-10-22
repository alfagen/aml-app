class PasswordsController < ApplicationController
  def edit
    render :edit, locals: { change_password_form: form, user: current_user }
  end

  def update
    if form.valid?
      current_user.change_password! form.password
      current_user.update locale: form.locale
      flash.now.alert = 'Профиль изменен.'
    else
      flash.now.alert = form.errors.messages.to_s
    end
    render :edit, locals: { change_password_form: form }
  end

  private

  def form
    @form ||= ChangePasswordForm.new(params.fetch(:change_password_form, {}).permit(:password,
                                                                                    :password_confirmation,
                                                                                    :current_password,
                                                                                    :locale).merge(user: current_user))
  end
end
