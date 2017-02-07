# Controller for publications.
class PublicationsController < ApplicationController
  before_action :authorize_librarians

  def new
    @publication = Publication.new
    @book = Book.find(params[:id])
  end

  def create
    @publication = Publication.new(ISBN: params[:publication][:ISBN],
                                   year: params[:publication][:year],
                                   book_id: params[:publication][:book],
                                   publisher_id: params[:publication][:publisher])
    if @publication.save
      redirect_to controller: 'books', action: 'show',
                  id: params[:publication][:book]
    else
      @book = Book.find(params[:publication][:book])
      render 'new'
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.update(
      params[:id], ISBN: params[:publication][:ISBN],
                   year: params[:publication][:year],
                   book_id: params[:publication][:book],
                   publisher_id: params[:publication][:publisher])
    if @publication.valid?
      redirect_to controller: 'books', action: 'show', id: @publication.book.id
    else
      render 'edit'
    end
  end

  def search
    @publications = Publication.select(:id, :ISBN, :book_id).where("\"ISBN\" like :q", q: "#{params[:ISBN]}%")
    respond_to do |format|
      format.json { render json:
                  {results: @publications.map{ |p| { id: p.id, text: p.ISBN + ' (' + p.book.title  + ')'} }}}
    end
  end

  def destroy
    Publication.destroy(params[:id])
    redirect_to :back
  end
end
