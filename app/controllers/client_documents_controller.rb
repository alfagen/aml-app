class ClientDocumentsController < ApplicationController
  def index
    render :index, locals: { client_documents: ClientDocument.page(params[:page]).ordered}
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
    params.require(:client_document).permit(:workflow_state, :file, :client_id, :document_kind_id)
  end
end
