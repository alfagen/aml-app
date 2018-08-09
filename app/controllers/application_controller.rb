# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_user

  def check_user
    return unless current_user&.blocked?
    logout
    redirect_back_or_to(:users)
  end
end
