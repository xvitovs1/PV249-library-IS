class ReadersController < ApplicationController
  def new
    @reader = Reader.new
    @user = User.find(params[:id])
  end

  def create
    @reader = Reader.new(card_code: params[:reader][:card_code])
    if @reader.save
      User.update(params[:user_id], reader_id: @reader.id)
			redirect_to controller: 'users', action: 'show', id: params[:user_id]
    else
      render 'new'
    end
  end

  def show
  end
end
