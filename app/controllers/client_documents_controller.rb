class ClientDocumentsController < ApplicationController
  def index
    render :index, locals: { client_documents: ClientDocument.page(params[:page]).ordered}
  end

  def show
    render :show, locals: { client_document: client_document }
  end

  def edit
    render :edit, locals: { client_document: client_document, client: client_document.client, document_kinds: DocumentKind.all.ordered }
  end

  def update
    client_document.update!(permitted_params)
    redirect_to client_documents_path
  rescue ActiveRecord::RecordInvalid
    render :edit, locals: { client_document: client_document, client: client_document.client, document_kinds: DocumentKind.all.ordered }
  end

  def destroy
    client_document.destroy
    redirect_back(fallback_location: root_path)
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
