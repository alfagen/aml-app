class ApplicationController < ActionController::Base
  include SetLocale
  helper LocalizedRender::Engine.helpers

  helper_method :current_time_zone, :current_operator

  def current_time_zone
    current_operator.time_zone || Time.zone
  end

  def current_operator
    current_user.aml_operator || raise("У текущего пользователя нет оператора") if current_user
  end
end
