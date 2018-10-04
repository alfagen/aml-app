module Amlapp
  class ApplicationController < ::ApplicationController
    rescue_from ActionController::InvalidAuthenticityToken, with: :rescue_invalid_authenticity_token
    rescue_from Workflow::Error, with: :humanized_error

    prepend_before_action :require_login

    helper_method :document_kinds

    ensure_authorization_performed except: [:error, :reset_db]

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

    def document_kinds
      @document_kinds ||= AML::DocumentKind.alive.ordered
    end

    def humanized_error(exception)
      Rails.logger.error exception
      Bugsnag.notify exception
      render 'humanized_error', status: 500, layout: 'simple', locals: { exception: exception }
    end

    def not_authenticated
      render 'not_authenticated', layout: 'simple'
    end

    def rescue_invalid_authenticity_token
      flash.alert = 'Просрочен токен аутентификации, авторизуйтесь снова'
      render 'not_authenticated', layout: 'simple'
    end
  end
end
