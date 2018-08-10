class PasswordsController < ApplicationController
  def edit
    render :edit, locals: { user: User.find(params[:id]) }
  end
end
