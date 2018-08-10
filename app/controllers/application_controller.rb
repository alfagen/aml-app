# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :logout_blocked_user

  def logout_blocked_user
    return unless current_user&.blocked?
    logout
    redirect_to new_user_session_path, alert: 'Пользователь заблокирован'
  end

  def not_authenticated
    render 'not_authenticated'
  end
end
