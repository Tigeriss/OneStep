module SessionsHelper

	def sign_in(user)
		puts "inside sign in"
		puts "create new remember token"
			remember_token = User.new_remember_token
			puts "try to save cookies"
			cookies.permanent[:remember_token] = remember_token
			puts "try to update attributes"
			user.update_attribute(:remember_token, User.encrypt(remember_token))
			puts "try to set current user"
			self.current_user = user
	end

	def signed_in?
		puts "check is current user nil"
		!current_user.nil?		
	end

	def current_user=(user)
		@current_user = user		
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def sign_out
		current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end
end
