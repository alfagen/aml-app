# frozen_string_literal: true

class ClientsController < ApplicationController
  include Pagination

  def index
    render :index, locals: { clients: paginate(Client.ordered) }
  end

  def show
    render :show, locals: { client: client, documents: client.client_documents.ordered }
  end

  def new
    render :new, locals: { client: Client.new(permitted_params) }
  end

  def create
    new_client = Client.new(permitted_params)
    new_client.save!
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
    params.fetch(:client, params.permit(:name, :inn)).permit(:name, :inn)
  end
end
