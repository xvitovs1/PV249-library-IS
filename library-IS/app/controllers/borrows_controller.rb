class BorrowsController < ApplicationController

  before_action :authorize_librarians

  def new
    @borrow = Borrow.new
    @user = User.find(params[:id])
  end

  def create
    edate = Date.today.to_time.advance(:months => get_num_months(params[:length])).to_date
    @borrow = Borrow.new(publication_id: params[:borrow][:publication_id], borrow_date: Date.today, expected_return_date: edate,
                        reader_id: params[:reader_id])
    if @borrow.save
      redirect_to controller: 'readers', action: 'show', id: params[:reader_id]
    else
      @user = User.find_by reader_id: params[:reader_id]
      render 'new'
    end
  end

  def return
    @borrow = Borrow.update(params[:id], return_date: Date.today)
    redirect_to :back
  end

  def show
    @borrow = Borrow.find(params[:id])
  end

  def index
  end

  def prolong
    @borrow = Borrow.find(params[:id])
    @user = User.find_by reader_id: @borrow.reader.id
  end

  def update
    edate = Date.today.to_time.advance(:months => get_num_months(params[:length])).to_date
    @borrow = Borrow.update(params[:id], expected_return_date: edate)
    redirect_to action: 'show', id: @borrow.id
  end

  private

  def get_num_months(param)
    if param == '3m'
      3
    elsif param == '6m'
      6
    elsif param == '1y'
      12
    else
      1
    end
  end
end
