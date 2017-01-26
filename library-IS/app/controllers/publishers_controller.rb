class PublishersController < ApplicationController

  before_action :authorize_librarians, only: [:add, :new, :create, :edit, :update, :destroy]

	def index
  end

  def show
    @publisher = Publisher.find(params[:id])
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
			redirect_to action: "show", id: @publisher.id
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

  def destroy
    Publisher.destroy(params[:id])
    redirect_to action: "index"
  end

end
