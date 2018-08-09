# frozen_string_literal: true

class ClientDocumentsController < ApplicationController
  include Pagination

  def index
    render :index, locals: { client_documents: client_documents, workflow_state: workflow_state }
  end

  def new
    render :new, locals: { client_document: ClientDocument.new(permitted_params),
                           client: Client.find(permitted_params[:client_id]),
                           document_kinds: DocumentKind.all.ordered }
  end

  def create
    ClientDocument.create!(permitted_params)
    redirect_to client_documents_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
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

  DEFAULT_WORKFLOW_STATE = :pending

  def workflow_state
    params[:workflow_state] || DEFAULT_WORKFLOW_STATE
  end

  def client_documents
    paginate(ClientDocument.where(workflow_state: workflow_state))
  end

  def client_document
    @client_document ||= ClientDocument.find params[:id]
  end

  def permitted_params
    params.fetch(:client_document).permit(:document_kind_id, :file, :client_id, :workflow_state)
  end
end
