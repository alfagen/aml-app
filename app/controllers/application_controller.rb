class ApplicationController < ActionController::Base
  include SetLocale
  helper LocalizedRender::Engine.helpers

  helper_method :current_time_zone

  def current_time_zone
    current_operator.time_zone_object || Time.zone
  end
end
