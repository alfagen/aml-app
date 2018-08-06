class ClientDocumentsController < ApplicationController
  include Pagination

  def index
    render :index, locals: { client_documents: paginate(ClientDocument.ordered) }
  end

  def new
    render :new, locals: { client_document: ClientDocument.new(permitted_params),
                           client: Client.find(permitted_params[:client_id]),
                           document_kinds: DocumentKind.all.ordered }
  end

  def create
    new_client_document = ClientDocument.new(permitted_params)
    new_client_document.save!
    flash[:alert] = { 'type' => 'success', 
                      'message' => "Документ: #{new_client_document.title} для клиента #{new_client_document.name} был создан" }
    redirect_to client_documents_path
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = { 'type' => 'error', 'message' => e.message }
    render :new, locals: { client_document: e.record, 
                           client: e.record.client,
                           document_kinds: DocumentKind.all.ordered }
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
    params.fetch(:client_document, params.permit(:client_id)).permit(:document_kind_id, :file, :client_id)
  end
end
