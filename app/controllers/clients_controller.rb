# frozen_string_literal: true

class ClientsController < ApplicationController
  include Pagination

  def index
    @q = Client.ransack(name_or_inn_cont: search_value)
    render :index, locals: { clients: paginate(@q.result.ordered) }
  end

  def show
    add_breadcrumb 'Клиенты', :clients_path
    add_breadcrumb "Клиент #{client.id}"
    render :show, locals: { client: client, orders: client.orders.ordered }
  end

  def new
    add_breadcrumb 'Клиенты', :clients_path
    add_breadcrumb 'Добавляем нового клиента'
    render :new, locals: { client: Client.new(permitted_params) }
  end

  def create
    Client.create!(permitted_params)
    redirect_to clients_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { client: e.record }
  end

  private

  def client
    @client ||= Client.find params[:id]
  end

  def permitted_params
    params.fetch(:client, {}).permit(:name, :inn)
  end

  def search_value
    params.permit(:utf8, :commit, q: [:name]).to_h.dig('q', 'name') || ''
  end
end
