class ReadersController < ApplicationController

  before_action :authorize_librarians

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

  def edit
    @reader = Reader.find(params[:id])
    @user = User.find_by reader_id: @reader.id
  end

  def update
    @reader = Reader.update(params[:id], card_code: params[:reader][:card_code])
    if @reader.valid?
      user = User.find_by reader_id: @reader.id
      redirect_to controller: 'users', action: 'show', id: user.id
    else
      render 'edit'
    end
  end

  def destroy
		user = User.find_by reader_id: params[:id]
    Reader.destroy(params[:id])
    redirect_to controller: 'users', action: 'show', id: user.id
	end

  def show
    user = User.find_by reader_id: params[:id]
    redirect_to controller: 'users', action: 'show', id: user.id
  end
end
