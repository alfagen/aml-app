# frozen_string_literal: true

class DocumentKindsController < ApplicationController
  include Pagination

  def index
    render :index, locals: { document_kinds: paginate(DocumentKind.ordered) }
  end

  def new
    render :new, locals: { document_kind: DocumentKind.new(permitted_params) }
  end

  def create
    new_document_kind = DocumentKind.new(permitted_params)
    new_document_kind.save!
    redirect_to document_kinds_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { document_kind: e.record }
  end

  private

  def permitted_params
    params.fetch(:document_kind, params.permit(:title)).permit(:title)
  end
end
