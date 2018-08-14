class PasswordResetsController < ApplicationController
  skip_before_action :require_login
    
  def create 
    user = User.find_by_email(params[:email])
    user.deliver_reset_password_instructions! if user
    redirect_to users_path
  end
    
  def edit
    if user_from_token.blank?
      not_authenticated
      return
    end
    render :edit, locals: { user: user_from_token, token: params[:id] }, layout: 'blank'
  end
      
  def update
    if user_from_token.blank?
      not_authenticated
      return
    end
    user_from_token.password_confirmation = params[:user][:password_confirmation]
    if user_from_token.change_password!(params[:user][:password])
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_from_token
    @user ||= User.load_from_reset_password_token(params[:id])
  end
end
