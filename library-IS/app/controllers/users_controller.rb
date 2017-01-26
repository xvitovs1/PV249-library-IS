class UsersController < ApplicationController

  before_action :authorize_librarians, only: [:index, :show]
  before_action :authorize, only: [:profile]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
  end

	private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
