class LibrariansController < ApplicationController

  before_action :authorize_librarians

	def new
    @librarian = Librarian.new
    @user = User.find(params[:id])
  end

  def create
    @librarian = Librarian.new(card_code: params[:librarian][:card_code])
    if @librarian.save
      User.update(params[:user_id], librarian_id: @librarian.id)
			redirect_to controller: 'users', action: 'show', id: params[:user_id]
    else
      render 'new'
    end
  end

  def show
    user = User.find_by librarian_id: params[:id]
    redirect_to controller: 'users', action: 'show', id: user.id
  end

  def denied
  end
end
