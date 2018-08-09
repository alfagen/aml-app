# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new; end

  def create
    if unblocked?(params[:email]) && login params.slice(:email, :password)
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
end
