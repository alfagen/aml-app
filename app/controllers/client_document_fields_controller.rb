class ClientDocumentFieldsController < ApplicationController
  def edit
    render :edit, locals: { client_document_field: client_document_field,
                            client_document: client_document,
                            document_kind_field_definition: client_document_field.definition }
  end

  def update
    client_document_field.update!(permitted_params)
    redirect_to client_document
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { client_document_field: e.record,
                            client_document: e.record.client_document,
                            document_kind_field_definition: e.record.definition }
  end

  private

  def client_document_field
    @client_document_field ||= ClientDocumentField.find params[:id]
  end

  def client_document
    @client_document ||= client_document_field.client_document
  end

  def permitted_params
    params.fetch(:client_document_field, {}).permit(:value)
  end
end
