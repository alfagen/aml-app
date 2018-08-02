class DocumentKindsController < ApplicationController
  def index
    render :index, locals: { document_kinds: DocumentKind.all.ordered }
  end

  def new
    render :new, locals: { document_kind: DocumentKind.new }
  end

  def create
    new_document_kind = DocumentKind.new(permitted_params)
    if new_document_kind.save
      redirect_to document_kinds_path
    else
      redirect_to new_document_kind_path, alert: new_document_kind.errors.full_messages.join(', ')
    end
  end

  private

  def permitted_params
    params.require(:document_kind).permit(:title)
  end
end
