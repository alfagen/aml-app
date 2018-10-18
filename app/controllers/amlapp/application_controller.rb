module Amlapp
  class ApplicationController < ::ApplicationController
    rescue_from ActionController::InvalidAuthenticityToken, with: :rescue_invalid_authenticity_token
    rescue_from Workflow::Error, with: :humanized_error

    prepend_before_action :require_login

    helper_method :document_kinds

    ensure_authorization_performed except: %i[error reset_db drop_clients drop_orders set_locale]

    LOCALES = { 'ru' => 'Europe/Moscow', 'cs' => 'Europe/Prague', 'en' => 'Europe/London' }.freeze

    def error
      raise 'test error'
    end

    def reset_db
      raise 'Доступно только на боевом' if Rails.env.production?

      AML.seed_demo!

      flash.alert = 'Данные полностью сброшены'
      redirect_to root_path
    end

    def drop_clients
      raise 'Доступно только на боевом' if Rails.env.production?

      AML::Client.destroy_all

      flash.alert = 'Клиенты сброшены'
      redirect_to root_path
    end

    def drop_orders
      raise 'Доступно только на боевом' if Rails.env.production?

      AML::Client.update_all aml_order_id: nil, aml_status_id: nil, aml_accepted_order_id: nil
      AML::OrderDocument.delete_all
      AML::Order.delete_all

      flash.alert = 'Заявки сброшены'
      redirect_to root_path
    end

    def set_locale
      if LOCALES[params[:locale]]
        I18n.locale = params[:locale].to_sym if I18n.available_locales.include?(params[:locale].to_sym)
        Time.zone = LOCALES[params[:locale]]
      end
      flash.notice = "Текущая локаль: #{Time.zone}"
      redirect_back(fallback_location: root_path)
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
