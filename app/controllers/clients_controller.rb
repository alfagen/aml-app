class ClientsController < ApplicationController
  def index
    render :index, locals: { clients: Client.all }
  end

  def new
    render :new, locals: { client: Client.new }
  end

  def create
    client = Client.new(client_params)
    if client.save
      redirect_to clients_path
    else
      render :edit, locals: { client: client }
    end
  end

  def edit
    client = Client.find(params[:id])
    render :edit, locals: { client: client }
  end

  def update
    client = Client.find(params[:id])
    if client.update(client_params)
      redirect_to clients_path
    else
      render :edit, locals: { client: client }
    end
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy
    redirect_to clients_path
  end 

  private

  def client_params
    params.require(:client).permit(:name, :inn)
  end
end
