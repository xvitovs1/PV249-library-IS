class BorrowsController < ApplicationController
  def new
    @borrow = Borrow.new
    @user = User.find(params[:id])
  end

  def create
    edate = Date.today.to_time.advance(:months => 1).to_date
    @borrow = Borrow.new(publication_id: params[:borrow][:publication_id], borrow_date: Date.today, expected_return_date: edate,
                        reader_id: params[:reader_id])
    if @borrow.save
      redirect_to controller: 'readers', action: 'show', id: params[:reader_id]
    else
      @user = User.find_by reader_id: params[:reader_id]
      render 'new'
    end
  end

  def show
  end

  def index
  end
end
