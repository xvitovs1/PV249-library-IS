class ReadersController < ApplicationController
  def new
    @reader = Reader.new
    @user = User.find(params[:id])
  end

  def create
    @user = User.find(params[:id])
    @reader = Reader.new(user_id: params[:reader][:user_id], card_code: params[:reader][:card_code])
    if @reader.save
      @user.reader = @reader
			redirect_to action: 'show', id: @reader.id
    else
      render 'new'
    end
  end

  def show
  end
end
