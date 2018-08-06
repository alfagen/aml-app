class DashboardController < ApplicationController
  def index
    # Пример флешек
    #
    flash.alert = 'Внимание'
    flash.notice = 'Сообщение'
  end
end
