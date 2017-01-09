class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name)
  end

  def new
    @author = Author.new
  end

  def add
    @author = Author.new(name: params[:author][:name])
    @author.save
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
end
