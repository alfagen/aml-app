class UsersController < ApplicationController
  layout 'simple'

  def edit
    render :edit, locals: { operator: current_user.aml_operator }
  end

  def update
    current_user.aml_operator.update! permitted_params
    flash.now.notice = 'Профиль изменен.'
    render :edit, locals: { operator: current_user.aml_operator }
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { operator: e.record }
  end

  private

  def permitted_params
    params.fetch(:operator, {}).permit(:email, :name, :locale, :time_zone_name)
  end
end
