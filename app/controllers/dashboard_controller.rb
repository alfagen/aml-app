class DashboardController < ApplicationController
  def index
    # Пример флешек
    #
    flash.now.alert = 'Внимание'
    flash.now.notice = 'Сообщение'
  end
end
