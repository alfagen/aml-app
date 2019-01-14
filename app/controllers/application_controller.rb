class ApplicationController < ActionController::Base
  include SetLocale
  helper NotyFlash::ApplicationHelper

  def not_authenticated
    redirect_to main_app.login_path
  end
end
