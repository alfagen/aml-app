# frozen_string_literal: true

module Amlapp
  class DocumentKindsController < Amlapp::ApplicationController
    include Pagination

    helper_method :document_group

    def index
      render :index, locals: { document_kinds: paginate(document_group.aml_document_kinds.ordered) }
    end

    def new
      render :new, locals: { document_kind: AML::DocumentKind.new(permitted_params) }
    end

    def create
      AML::DocumentKind.create!(permitted_params)
      render :index, locals: { document_kinds: paginate(document_group.aml_document_kinds.ordered) }
    rescue ActiveRecord::RecordInvalid => e
      flash.now.alert = e.message
      render :new, locals: { document_kind: e.record }
    end

    def show
      render :show, locals: { document_kind: document_kind }
    end

    private

    def document_kind
      @document_kind ||= AML::DocumentKind.find params[:id]
    end

    def document_group
      @document_group ||= AML::DocumentGroup.find permitted_params[:aml_document_group_id]
    end

    def permitted_params
      params.fetch(:document_kind, {}).permit(:title, :details, :position, :aml_document_group_id)
    end
  end
end
