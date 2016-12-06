class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			flash[:success] = "Signed in"
			log_in(@user)
			current_user = @user
			redirect_to root_path
		else
			flash.now[:danger] = "Invalid login details"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end