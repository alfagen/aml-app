class ClientDocumentsController < ApplicationController
  def index
    render :index, locals: { client_documents: ClientDocument.all }
  end

  def show
    render :show, locals: { client_document: ClientDocument.find(params[:id]) }
  end

  def new
    render :new, locals: { client_document: ClientDocument.new, clients: Client.all, document_kinds: DocumentKind.all }
  end

  def create
    client_document = ClientDocument.new(client_document_params)
    if client_document.save
      redirect_to client_documents_path
    else
      render :edit, locals: { client_document: client_document }
    end
  end

  def edit
    client_document = ClientDocument.find(params[:id])
    render :edit, locals: { client_document: client_document, clients: Client.all, document_kinds: DocumentKind.all }
  end

  def update
    client_document = ClientDocument.find(params[:id])
    if client_document.update(client_document_params)
      redirect_to client_documents_path
    else
      render :edit, locals: { client_document: client_document }
    end
  end

  def destroy
    client_document = ClientDocument.find(params[:id])
    client_document.destroy
    redirect_to client_documents_path
  end

  def accept
    client_document = ClientDocument.find(params[:id])
    client_document.accept!
    redirect_to client_document_path(client_document)
  end

  def reject
    client_document = ClientDocument.find(params[:id])
    client_document.reject!
    redirect_to client_document_path(client_document)
  end

  private

  def client_document_params
    params.require(:client_document).permit(:workflow_state, :file, :client_id, :document_kind_id)
  end
end
