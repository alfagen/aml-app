# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new; end

  def create
    if login(permitted_params[:email], permitted_params[:password])
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

  def permitted_params
    params.fetch(:session).permit(:email, :password)
  end
end
