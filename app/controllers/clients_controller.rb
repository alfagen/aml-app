# frozen_string_literal: true

class ClientsController < ApplicationController
  include Pagination

  def index
    render :index, locals: { clients: paginate(Client.ordered) }
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
end
