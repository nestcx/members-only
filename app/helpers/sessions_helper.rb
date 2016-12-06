module SessionsHelper

	def log_in(user)
		remember_token = User.create_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
		self.current_user = user
	end

	def current_user
		@current_user ||= User.find_by(remember_token: User.digest(cookies[:remember_token]))
	end

	def current_user=(user)
		@current_user = user
	end

	def signed_in?
		#calls the method
		!current_user.nil?
	end


def current_user
  remember_token = User.digest(cookies[:remember_token])
  @current_user ||= User.find_by(remember_token: remember_token)
end

	def sign_out
		cookies.delete(:remember_token)
		@current_user = nil
	end

end