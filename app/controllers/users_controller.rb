class UsersController < ApplicationController
  def edit
    render :edit, locals: { user: current_operator }
  end

  def new
    operator = AML::Operator.create!(email: email, name: email)
    User.new(aml_operator_id: operator.id)
  end

  def update
    current_operator.update! permitted_params
    flash.now.notice = 'Профиль изменен.'
    render :edit, locals: { user: current_operator }
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { user: e.record }
  end

  private

  def permitted_params
    params.fetch(:operator, {}).permit(:email, :name, :locale, :time_zone_name)
  end
end
