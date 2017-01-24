class ReadersController < ApplicationController
  def new
    @reader = Reader.new
    @user = User.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @reader = Reader.new(card_code: params[:reader][:card_code])
    if @reader.save
      @user.reader = @reader
			redirect_to controller: 'users', action: 'show', id: @user.id
    else
      render 'new'
    end
  end

  def show
  end
end
