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
			#TODO
    else
      render 'new'
    end
  end

end
