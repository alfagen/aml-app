# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_login
  layout 'blank'

  def new; end

  def create
    if login(permitted_params[:email], permitted_params[:password])
      redirect_back_or_to(:users)
    else
      flash.now.alert = 'Не получилось войти'
      render :new
    end
  end

  def destroy
    logout
    redirect_back_or_to(:users)
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password)
  end
end
