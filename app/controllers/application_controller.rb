class ApplicationController < ActionController::Base
  include SetLocale
  helper NotyFlash::ApplicationHelper
end
