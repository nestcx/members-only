class User < ApplicationRecord

	has_many :posts
	has_many :comments

	has_secure_password

	def self.create_token
		SecureRandom.urlsafe_base64
	end

	def self.digest(token)
	  Digest::SHA1.hexdigest(token.to_s)
	end

end