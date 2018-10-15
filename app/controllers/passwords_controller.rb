class PasswordsController < ApplicationController
  def edit
    render :edit, locals: { change_password_form: form }
  end

  def update
    if form.valid?
      current_user.update! form.attributes.slice(:password, :password_confirmation)
      redirect_to orders_path
    else
      flash.now.alert = form.errors.messages
      render :edit, locals: { change_password_form: form }
    end
  end

  private

  def form
    @form ||= ChangePasswordForm.new params.fetch(:change_password_form, {}).permit!
  end
end
