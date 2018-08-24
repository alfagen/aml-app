class ClientDocumentFieldsController < ApplicationController
  def new
    render :new, locals: { client_document: client_document,
                           document_kind_field_definition: document_kind_field_definition,
                           client_document_field: ClientDocumentField.new(permitted_params) }
  end

  def create
    ClientDocumentField.create!(permitted_params)
    redirect_to client_document
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { client_document_field: e.record }
  end

  def edit
    render :edit, locals: { client_document_field: client_document_field,
                            client_document: client_document_field.client_document,
                            document_kind_field_definition: client_document_field.document_kind_field_definition }
  end

  def update
    client_document_field.update!(permitted_params)
    redirect_to client_document
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { client_document_field: e.record,
                            client_document: e.record.client_document,
                            document_kind_field_definition: e.record.document_kind_field_definition }
  end

  private

  def client_document
    @client_document ||= ClientDocument.find permitted_params[:client_document_id]
  end

  def client_document_field
    @client_document_field ||= ClientDocumentField.find params[:id]
  end

  def document_kind_field_definition
    @document_kind_field_definition ||= DocumentKindFieldDefinition.find permitted_params[:document_kind_field_definition_id]
  end

  def permitted_params
    params.fetch(:client_document_field, {}).permit(:value, :client_document_id, :document_kind_field_definition_id)
  end
end
