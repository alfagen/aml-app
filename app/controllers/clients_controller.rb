class ClientsController < ApplicationController
  def index
    render :index, locals: { clients: Client.page(params[:page]).ordered }
  end

  def show
    render :show, locals: { client: client, client_documents: client.client_documents, document_kinds: DocumentKind.all.ordered }
  end

  def new
    render :new, locals: { client: Client.new }
  end

  def create
    new_client = Client.new(client_params)
    if new_client.save
      redirect_to clients_path
    else
      flash.now[:alert] = new_client.errors.full_messages
      render :new, locals: { client: Client.new }
    end
  end

  def document
    new_client_document = ClientDocument.new(document_params)
    if new_client_document.save
      redirect_to client_path(client)
    else
      flash.now[:alert] = new_client_document.errors.full_messages
      render :show, locals: { client: client, client_documents: client.client_documents, document_kinds: DocumentKind.all.ordered }
    end
  end

  private

  def client
    @client ||= Client.find params[:id]
  end

  def permitted_params
    params.permit(:name, :inn, :id, client_document:[:document_kind_id, :file], client:[:name, :inn])
  end

  def document_params
    { document_kind_id: permitted_params[:client_document][:document_kind_id],
      file: permitted_params[:client_document][:file],
      client_id: permitted_params[:id] }
  end

  def client_params
    { name: permitted_params[:client][:name],
      inn: permitted_params[:client][:inn] }
  end
end
