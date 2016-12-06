class User < ApplicationRecord

	has_many :posts

	before_create do
		create_remember_token
	end

	has_secure_password

	def self.create_token
		SecureRandom.urlsafe_base64
	end

	def self.digest(token)
	  Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.digest(User.create_token)
		end

end
