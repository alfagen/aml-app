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
    DocumentKind.create!(permitted_params)
    redirect_to document_kinds_path
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { document_kind: e.record }
  end

  def show
    render :show, locals: { document_kind: document_kind,
                            all_fields: document_kind.document_kind_field_definitions,
                            fields: document_kind_field_definitions,
                            state: state }
  end

  private

  DEFAULT_STATE = :alive

  def state
    params[:state] || DEFAULT_STATE
  end

  def document_kind_field_definitions
    document_kind.document_kind_field_definitions.send(state).ordered if ['alive', 'archive'].include? state.to_s
  end

  def document_kind
    @document_kind ||= DocumentKind.find params[:id]
  end

  def permitted_params
    params.fetch(:document_kind).permit(:title, :state)
  end
end
