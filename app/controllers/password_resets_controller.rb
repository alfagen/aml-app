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
      render 'passwords/edit', locals: { user: user }
    else
      flash.now.alert = 'Просрочен токен аутентификации, авторизуйтесь снова'
      render 'new'
    end
  end

  def update
    current_user.password_confirmation = params[:user][:password_confirmation]
    current_user.change_password! params[:user][:password]
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render 'passwords/edit', locals: { user: e.record }
  end
end
