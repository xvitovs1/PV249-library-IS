class PublishersController < ApplicationController
	def index
  end

  def add
    @publisher = Publisher.new(name: params[:name])
    @publisher.save
		render :json => { :status => :ok, :message => "Success!", :publisher_id => @publisher.id }
  end

	def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(name: params[:publisher][:name])
    if @publisher.save
			redirect_to 'index'
    else
      render 'new'
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.update(params[:id], name: params[:publisher][:name])
    if @publisher.valid?
      redirect_to action: "show", id: @publisher.id
    else
      render "edit"
    end
  end

end
