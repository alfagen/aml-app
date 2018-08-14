class PasswordResetsController < ApplicationController
  skip_before_action :require_login
  before_action :require_user_from_token, except: :create

  def create
    user = User.find_by_email(params[:email])
    user&.deliver_reset_password_instructions!
  rescue StandardError
    flash.now.alert = 'Не удалось отправить email'
  end

  def edit
    render 'passwords/edit', locals: { user: user_from_token, token: params[:id] }
  end

  def update
    change_password!
  rescue StandardError
    flash.now.alert = 'Не удалось изменить пароль'
    render 'passwords/edit', locals: { user: user_from_token, token: params[:id] }
  end

  private

  def change_password!
    user_from_token.password_confirmation = params[:user][:password_confirmation]
    user_from_token.change_password!(params[:user][:password])
  end

  def require_user_from_token
    if user_from_token.blank?
      not_authenticated
    else
      auto_login(user_from_token)
    end
  end

  def user_from_token
    @user_from_token ||= User.load_from_reset_password_token(params[:id])
  end
end
