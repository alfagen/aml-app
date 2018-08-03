class ClientsController < ApplicationController
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
    flash[:alert] = e.message
    render :new, locals: { client: e.record }
  end

  private

  def client
    @client ||= Client.find params[:id]
  end

  def permitted_params
    params[:client] ? params.require(:client).permit(:name, :inn) : params.permit(:name, :inn)
  end
end
