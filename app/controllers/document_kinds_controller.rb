class DocumentKindsController < ApplicationController
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
    flash[:alert] = e.message
    render :new, locals: { document_kind: e.record }
  end

  private

  def permitted_params
    params[:document_kind] ? params.require(:document_kind).permit(:title) : params.permit(:title)
  end
end
