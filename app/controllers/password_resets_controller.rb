class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def create
    user = User.find_by_email(params[:email])
    user&.deliver_reset_password_instructions!
    redirect_to users_path
  end

  def edit
    check_user?
    render :edit, locals: { user: user_from_token, token: params[:id] }, layout: 'blank'
  end

  def update
    check_user?
    user_from_token.password_confirmation = params[:user][:password_confirmation]
    if user_from_token.change_password!(params[:user][:password])
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def check_user?
    not_authenticated if user_from_token.blank?
  end

  def user_from_token
    @user_from_token ||= User.load_from_reset_password_token(params[:id])
  end
end
