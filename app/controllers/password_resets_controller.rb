class PasswordResetsController < ApplicationController
  before_action :require_login, only: [:edit, :update]

  def create
    user = User.find_by_email(params[:email])
    user&.deliver_reset_password_instructions!
  rescue StandardError
    flash.now.alert = 'Не удалось отправить email'
  end

  def edit
    not_authenticated if current_user.blank?
    auto_login(current_user)
    render 'passwords/edit', locals: { user: current_user, token: params[:id] }
  end

  def update
    not_authenticated if current_user.blank?
    auto_login(current_user)
    change_password!
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render 'passwords/edit', locals: { user: e.record, token: params[:id] }
  end

  private

  def change_password!
    current_user.password_confirmation = params[:user][:password_confirmation]
    current_user.change_password!(params[:user][:password])
  end

  def current_user
    @current_user ||= User.load_from_reset_password_token(params[:id])
  end
end
