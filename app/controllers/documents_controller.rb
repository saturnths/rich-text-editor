class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = "New document created."
      redirect_to documents_path
    else
      render "new"
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(document_params)
      flash[:success] = "Changes saved."
      redirect_to documents_path
    else
      render "edit"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:success] = "Document removed."
    redirect_to :action => 'index'
  end

  private

    def document_params
      params.require(:document).permit(:title, :body)
    end
end
