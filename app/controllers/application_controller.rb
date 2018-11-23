class ApplicationController < ActionController::Base
  include SetLocale
  helper LocalizedRender::Engine.helpers
end
