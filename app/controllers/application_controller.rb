class ApplicationController < ActionController::Base
  before_action :require_login

  rescue_from ActionController::InvalidAuthenticityToken, with: :rescue_invalid_authenticity_token

  def error
    raise 'test error'
  end

  def reset_db
    raise 'Доступно только на боевом' if Rails.env.production?

    AML.seed_demo!

    flash.alert = 'Данные полностью сброшены'
    redirect_to root_path
  end

  private

  def not_authenticated
    render 'not_authenticated', layout: 'simple'
  end

  def rescue_invalid_authenticity_token
    flash.alert = 'Просрочен токен аутентификации, авторизуйтесь снова'
    render 'not_authenticated', layout: 'simple'
  end
end
