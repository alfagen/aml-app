class LocalesController < ApplicationController
  include SetLocale

  def update
    current_user.update! locale: params[:locale]
    flash.notice = "Вы установили локаль: #{current_user.locale}"
    redirect_back(fallback_location: root_path)
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    redirect_back(fallback_location: root_path)
  end
end
