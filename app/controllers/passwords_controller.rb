class PasswordsController < ApplicationController
  skip_before_action :require_login, :unless => :password_changed?

  def edit
    login user_session.login, 'password', true unless current_user
    render :edit, locals: { user: user }
  end
  
  private

  def user
    @user ||= User.find params[:id]
  end

  def user_session
    @user_session ||= UserSession.new(login: user.email, password: 'password')
  end

  def password_changed?
    user.password_changed == true
  end
end
