class LocalesController < ApplicationController
  layout 'simple'

  def update
    locale = available_locale params[:locale]
    if locale.present?
      I18n.locale = session[:locale] = locale
    else
      flash.alert = "Такая локаль #{params[:locale]} не поддерживается"
    end
    redirect_back(fallback_location: root_path)
  end
end
