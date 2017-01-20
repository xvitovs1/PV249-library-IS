class PublicationsController < ApplicationController
  def new
    @publication = Publication.new
    @book = Book.find(params[:id])
  end

  def create
    @publication = Publication.new(ISBN: params[:publication][:ISBN], year: params[:publication][:year], book_id: params[:publication][:book],
                                   publisher_id: params[:publication][:publisher])
    if @publication.save
      redirect_to controller:'books', action: 'show', id: params[:publication][:book]
    else
      @book = Book.find(params[:publication][:book])
      render "new"
    end
  end
end
