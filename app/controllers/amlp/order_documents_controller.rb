# frozen_string_literal: true

module Amlp
  class OrderDocumentsController < Amlp::ApplicationController
    include Pagination

    def index
      render :index, locals: { documents: documents, workflow_state: workflow_state }
    end

    def edit
      render :edit, locals: { order_document: order_document,
                              order: order_document.order }
    end

    def update
      order_document.update!(permitted_params)
      redirect_to order_document_path(order_document)
    rescue ActiveRecord::RecordInvalid => error
      flash.now.alert = error.message
      render :edit, locals: error_params(error)
    end

    def show
      render :show, locals: { order_document: order_document,
                              fields: order_document.document_fields }
    end

    def accept
      order_document.accept!
      redirect_to order_document_path(order_document)
    end

    def reject
      order_document.reject!
      redirect_to order_document_path(order_document)
    end

    private

    DEFAULT_WORKFLOW_STATE = :none

    def workflow_state
      params[:workflow_state] || DEFAULT_WORKFLOW_STATE
    end

    def documents
      paginate(AML::OrderDocument.where(workflow_state: workflow_state))
    end

    def order_document
      @order_document ||= AML::OrderDocument.find params[:id]
    end

    def permitted_params
      params.fetch(:order_document).permit(:document_kind_id, :image, :order_id, :workflow_state)
    end
  end
end
