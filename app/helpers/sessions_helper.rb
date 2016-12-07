module SessionsHelper

	def log_in(user)
		remember_token = User.create_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
	end

	#we search by cookies!!, so ofcourse there is NO need to set it above ^
	#the posts controller #create action gets the current user's id from this function
	def current_userra
		@current_user ||= User.find_by(remember_token: User.digest(cookies[:remember_token]))
	end

	def signed_in?
		!current_userra.nil?
	end

	def sign_out
		cookies.delete(:remember_token)
		@current_user = nil
	end

end