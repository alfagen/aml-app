class UsersController < ApplicationController
  def edit
    render :edit, locals: { user: current_user }
  end

  def update
    current_user.update! permitted_params
    flash.now.notice = 'Профиль изменен.'
    render :edit, locals: { user: current_user }
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { user: e.record }
  end

  private

  def permitted_params
    params.fetch(:operator, {}).permit(:email, :name, :locale, :time_zone)
  end
end
