class UsersController < ApplicationController

  before_action :authorize_librarians, only: [:index, :show, :destroy]
  before_action :authorize, only: [:profile, :edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.birthday = params[:birthdayPicker_birthDay]
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

  def destroy
    User.destroy(params[:id])
    redirect_to :back
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.update(params[:id], name: params[:user][:name], email: params[:user][:email], password: params[:user][:password],
                        password_confirmation: params[:user][:password_confirmation], city: params[:user][:city], street: params[:user][:street],
                        postcode: params[:user][:postcode], birthday: params[:birthdayPicker_birthDay])
    if @user.valid?
      redirect_to action: "profile"
    else
      render "edit"
    end
  end

	private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :city, :street, :postcode)
  end
end
