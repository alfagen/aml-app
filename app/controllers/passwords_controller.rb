class PasswordsController < ApplicationController
  def edit
    render :edit, locals: { change_password_form: ChangePasswordForm.new }
  end

  def update
    current_user.update! permitted_params
    redirect_to orders_path
  end

  private

  def permitted_params
    params.require(:change_password_form).permit(:password, :password_confirmation)
  end
end
