class ApplicationController < ActionController::Base
  include SetLocale
  helper NotyFlash::ApplicationHelper
  helper LocalizedRender::Engine.helpers
end
