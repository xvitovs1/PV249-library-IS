class BooksController < ApplicationController

  before_action :authorize_librarians, only: [:new, :create, :edit, :update, :destroy]

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
      if params[:book][:author]
        @author = Author.find(params[:book][:author])
      end
      render "new"
    end
  end

  def show
    begin
      @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to action: "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.update(params[:id], title: params[:book][:title], description: params[:book][:description], author_id: params[:book][:author])
    if @book.valid?
      redirect_to action: "show", id: @book.id
    else
      render "edit"
    end
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to :back
  end
end
