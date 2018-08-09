# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_login
  layout 'empty'

  def new; end

  def create
    if unblocked?(permitted_params[:email]) && login(permitted_params[:email], permitted_params[:password])
      redirect_back_or_to(:users)
    else
      flash.now.alert = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_back_or_to(:users)
  end

  private

  def unblocked?(email)
    User.exists?(email: email, workflow_state: :unblocked)
  end

  def permitted_params
    params.require(:user).permit(:email, :password)
  end
end
