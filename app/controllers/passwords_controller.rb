class PasswordsController < ApplicationController
  def edit
    render :edit, locals: { user: current_user }
  end

  def update
    check_password
    current_user.update!(permitted_params.except(:current_password))
    if permitted_params[:password].present?
      flash.now.notice = 'Пароль изменен'
    else
      flash.now.alert = 'Укажите пароли для изменения'
    end
    redirect_to orders_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { user: current_user }
  end

  private

  def permitted_params
    params.require(:operator).permit(:email, :current_password, :password, :password_confirmation)
  end

  def check_password
    unless current_user.valid_password? permitted_params[:current_password]
      current_user.errors.add(:current_password, 'Текущий пароль не верен.')
      raise ActiveRecord::RecordInvalid.new(current_user)
    end
  end
end
