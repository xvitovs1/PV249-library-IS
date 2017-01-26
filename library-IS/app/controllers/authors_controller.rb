class AuthorsController < ApplicationController

  before_action :authorize_librarians, only: [:new, :add, :create, :edit, :update, :destroy]

  def index
    @authors = Author.order(:name)
  end

  def new
    @author = Author.new
  end

  def add
    @author = Author.new(name: params[:name])
    @author.save
		render :json => { :status => :ok, :message => "Success!", :author_id => @author.id }
  end

  def create
    @author = Author.new(name: params[:author][:name])
    if @author.save
			redirect_to action: 'show', id: @author.id
    else
      render 'new'
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.update(params[:id], name: params[:author][:name])
    if @author.valid?
      redirect_to action: "show", id: @author.id
    else
      render "edit"
    end
  end

  def destroy
    Author.destroy(params[:id])
    redirect_to action: "index"
  end
end
