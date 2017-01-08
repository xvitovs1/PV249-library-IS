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
			#redirect_to action: 'index'
    else
      render 'new'
    end
  end
end
