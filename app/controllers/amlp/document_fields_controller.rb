module AMLP
  class DocumentFieldsController < AMLP::ApplicationController
    def edit
      render :edit, locals: { document_field: document_field,
                              order_document: order_document,
                              document_kind_field_definition: document_field.definition }
    end

    def update
      document_field.update!(permitted_params)
      redirect_to order_document_path(order_document)
    rescue ActiveRecord::RecordInvalid => error
      flash.now.alert = error.message
      render :edit, locals: error_params(error)
    end

    private

    def document_field
      @document_field ||= AML::DocumentField.find params[:id]
    end

    def order_document
      @order_document ||= document_field.order_document
    end

    def permitted_params
      params.fetch(:document_field, {}).permit(:value)
    end

    def error_params(error)
      { document_field: error.record,
        order_document: error.record.order_document,
        document_kind_field_definition: error.record.definition }
    end
  end
end
