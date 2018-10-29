class ApplicationController < ActionController::Base
  include SetLocale
  helper LocalizedRender::Engine.helpers

  helper_method :current_time_zone

  def current_time_zone
    current_user.time_zone || Time.zone
  end
end
