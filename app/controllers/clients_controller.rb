class ClientsController < ApplicationController
  def index
    render :index, locals: { clients: Client.page(params[:page]).ordered }
  end

  def show
    render :show, locals: { client: client, documents: client.client_documents }
  end

  def new
    render :new, locals: { client: Client.new }
  end

  def create
    new_client = Client.new(permitted_params)
    new_client.save!
    redirect_to clients_path
  rescue ActiveRecord::RecordInvalid => e
    redirect_to new_client_path, alert: new_client.errors.full_messages.join(', ')
  end

  private

  def client
    @client ||= Client.find params[:id]
  end

  def permitted_params
    params.require(:client).permit(:name, :inn)
  end
end
