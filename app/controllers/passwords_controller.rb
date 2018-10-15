class PasswordsController < ApplicationController
  def edit
    render :edit, locals: { change_password_form: change_password_form }
  end

  def update
    current_user.change_password! form_params[:password]

    flash.now.notice = 'Пароль изменен'

    redirect_to orders_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { change_password_form: change_password_form }
  end

  private

  def form_params
    params.fetch(:change_password_form, {}).permit(:current_password, :password, :password_confirmation)
  end

  def change_password_form
    @change_password_form ||= ChangePasswordForm.new(form_params.merge(user_id: current_user.id))
  end
end
