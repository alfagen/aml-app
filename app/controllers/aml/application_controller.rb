module AML
  class ApplicationController < ::ApplicationController
    before_action :require_login

    rescue_from ActionController::InvalidAuthenticityToken, with: :rescue_invalid_authenticity_token

    private

    def not_authenticated
      render 'not_authenticated', layout: 'simple'
    end

    def rescue_invalid_authenticity_token
      flash.alert = 'Просрочен токен аутентификации, авторизуйтесь снова'
      render 'not_authenticated', layout: 'simple'
    end
  end
end
