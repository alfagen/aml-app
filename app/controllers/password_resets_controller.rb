class PasswordResetsController < ApplicationController
  layout 'simple'

  before_action :require_login, only: [:update]

  def create
    user = User.find_by email: params.require(:password_reset).fetch(:email)
    user&.deliver_reset_password_instructions!
  end

  def edit
    user = User.load_from_reset_password_token(params[:id])

    if user.present?
      auto_login user
      render :edit, locals: { user: user }
    else
      flash.now.alert = 'Просрочен токен аутентификации, авторизуйтесь снова'
      render :new
    end
  end

  def update
    current_user.change_password! params.require(:user).require(:password)
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { user: e.record }
  end
end
