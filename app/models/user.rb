require 'digest/sha1'

class User < ActiveRecord::Base
	attr_accessible :username, :fname, :lname
	
	validates_presence_of 	:username, :fname, :lname
	validates_uniqueness_of :username
	validates_length_of :username, :in => 2..8
	validates_length_of :fname, :minimum=>2
	validates_length_of :lname, :minimum=>2

	attr_accessor :password_confirmation
	validates_confirmation_of :password
	
	
	def validate
		errors.add_to_base("Missing password" ) if hashed_password.blank?
	end

	def self.authenticate(username, password)
		user = self.find_by_username(username)
		if user
			expected_password = encrypted_password(password, user.salt)
			if user.hashed_password != expected_password
				user = nil
			end
		end
		user
	end


	# 'password' is a virtual attribute
	def password
		@password
	end

	#need to troubleshoot why 	
	def password=(pwd)
		#raise pwd.to_yaml
		@password = pwd
		
		return if pwd.blank?
		create_new_salt
		self.hashed_password = User.encrypted_password(self.password, self.salt)
	end
	
	private
	
	def self.encrypted_password(password, salt)
		string_to_hash = password + "wibble" + salt
		Digest::SHA1.hexdigest(string_to_hash)
	end

	def create_new_salt
		self.salt = self.object_id.to_s + rand.to_s
	end

end
