class LibrariansController < ApplicationController

  before_action :authorize_librarians, only: [:show]
  before_action :authorize_admin, only: [:destroy, :create, :new, :update]

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

	def edit
    @librarian = Librarian.find(params[:id])
    @user = User.find_by librarian_id: @librarian.id
  end

  def update
    @librarian = Librarian.update(params[:id], card_code: params[:librarian][:card_code])
    if @librarian.valid?
      user = User.find_by librarian_id: @librarian.id
      redirect_to controller: 'users', action: 'show', id: user.id
    else
      render 'edit'
    end
  end

  def destroy
		user = User.find_by librarian_id: params[:id]
    Librarian.destroy(params[:id])
    redirect_to controller: 'users', action: 'show', id: user.id
  end

  def denied
  end
end
