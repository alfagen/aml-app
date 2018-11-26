class ApplicationController < ActionController::Base
  helper NotyFlash::ApplicationHelper
  helper LocalizedRender::Engine.helpers
end
