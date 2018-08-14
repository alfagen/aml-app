class PasswordResetsController < ApplicationController
  before_action :require_login, only: [:edit, :update]

  def create
    new_user = User.find_by_email(params[:email])
    new_user&.deliver_reset_password_instructions!
  rescue StandardError
    flash.now.alert = 'Не удалось отправить email'
  end

  def edit
    auto_login(user)
    render 'passwords/edit', locals: { user: user, token: params[:format] }
  end

  def update
    auto_login(user)
    change_password!
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render 'passwords/edit', locals: { user: e.record, token: params[:format] }
  end

  private

  def require_login
    not_authenticated if user.blank?
  end

  def change_password!
    user.password_confirmation = params[:user][:password_confirmation]
    user.change_password!(params[:user][:password])
  end

  def user
    @user ||= User.load_from_reset_password_token(params[:format])
  end
end
