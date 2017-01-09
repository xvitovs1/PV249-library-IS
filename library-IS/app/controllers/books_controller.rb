class BooksController < ApplicationController
  def index
  end

  def new
    @book = Book.new
    if params[:id]
      @author = Author.find(params[:id])
    end
  end

  def create
    @book = Book.new(title: params[:book][:title], author_id: params[:book][:author], description: params[:book][:description])
    if @book.save
      redirect_to action: "show", id: @book.id
    else
      render "new"
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
