class ClientDocumentsController < ApplicationController
  def index
    render :index, locals: { client_documents: ClientDocument.page(params[:page]).ordered}
  end

  def new
    render :new, locals: { client_document: ClientDocument.new, client: Client.find(params[:client_id]), document_kinds: DocumentKind.all.ordered }
  end

  def create
    new_client_document = ClientDocument.new(document_params)
    new_client_document.save!
    redirect_to client_documents_path
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = new_client_document.errors.full_messages.join(', ')
    redirect_to client_path(Client.find(document_params[:client_id]))
  end

  def show
    render :show, locals: { client_document: client_document }
  end

  def accept
    client_document.accept!
    redirect_to client_document_path(client_document)
  end

  def reject
    client_document.reject!
    redirect_to client_document_path(client_document)
  end

  private

  def client_document
    @client_document ||= ClientDocument.find params[:id]
  end

  def permitted_params
    params.permit(client_document:[:document_kind_id, :file, :client_id])
  end

  def document_params
    { document_kind_id: permitted_params[:client_document][:document_kind_id],
      file: permitted_params[:client_document][:file],
      client_id: permitted_params[:client_document][:client_id] }
  end
end
