class DocumentKindsController < ApplicationController
  def index
    render :index, locals: { document_kinds: DocumentKind.all }
  end

  def new
    render :new, locals: { document_kind: DocumentKind.new }
  end

  def create
    document_kind = DocumentKind.new(document_kind_params)
    if document_kind.save
      redirect_to document_kinds_path
    else
      render :edit, locals: { document_kind: document_kind }
    end
  end

  def edit
    document_kind = DocumentKind.find(params[:id])
    render :edit, locals: { document_kind: document_kind }
  end

  def update
    document_kind = DocumentKind.find(params[:id])
    if document_kind.update(document_kind_params)
      redirect_to document_kinds_path
    else
      render :edit, locals: { document_kind: document_kind }
    end
  end

  def destroy
    document_kind = DocumentKind.find(params[:id])
    document_kind.destroy
    redirect_to document_kinds_path
  end 

  private

  def document_kind_params
    params.require(:document_kind).permit(:title)
  end
end
