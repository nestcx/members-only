class UsersController < ApplicationController

	before_action :logged_in, only:[:index, :show]

  def new
  	@user = User.new
  end

  def index
  	@users = User.all
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Signed up!"
  		redirect_to(@user)
  	else
  		flash[:danger] = "Error"
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in
  	unless signed_in?
  		flash[:danger] = "You must be logged in!"
  		redirect_to root_path
  	end
  end
end