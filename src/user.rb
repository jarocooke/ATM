class User
	attr_accessor :user_pin
	
	def initialize
		puts "Please enter your PIN or C)ancel"
		user_pin = gets.chomp
		return user_pin
	end
	
	def request_pin
		puts "Please enter your PIN or C)ancel"
		
		user_pin = gets.chomp
		return user_pin
	end
	
end