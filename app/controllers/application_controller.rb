class ApplicationController < ActionController::Base
  before_action :require_login, unless: :first_user?

  rescue_from ActionController::InvalidAuthenticityToken, with: :rescue_invalid_authenticity_token

  private

  def first_user?
    AML::Operator.all.empty?
  end

  def not_authenticated
    render 'not_authenticated', layout: 'simple'
  end

  def rescue_invalid_authenticity_token
    flash.alert = 'Просрочен токен аутентификации, авторизуйтесь снова'
    render 'not_authenticated', layout: 'simple'
  end
end
