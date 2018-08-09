class PasswordsController < ApplicationController
  def edit
    render :edit, locals: { user: user }
  end

  def update
    user.update!(permitted_params.merge(id: params[:user_id]))
    redirect_to users_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { user: e.record }
  end

  private

  def user
    @user ||= User.find params[:user_id]
  end

  def permitted_params
    params.fetch(:user).permit(:password, :password_confirmation)
  end
end
