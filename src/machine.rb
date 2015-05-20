#Creates bank account object to be manipulated
require_relative 'account'

class Machine
	attr_accessor :account_details, :open_account
	
	def initialize
		@account_details = []
		@pin_counter = 0
		#@open_account = open_account
	end

	def load_default_account_details
		account_details[0] = "J Cooke"
		account_details[1] = "04-98-27"
		account_details[2] = "87302945"
		account_details[3] = "100.00"
		account_details[4] = "1111"
	end

	def load_account_details(account)
		if File.exist?(account)
			io_file = File.open(account, 'r')
			io_file.each_line do |line|
				account_details << line.chomp
			end
			io_file.close
		else
			io_file = File.open(account, 'w+')
			load_default_account_details
		end
		@open_account = Bank_account.new(account_details)
	end
	
	def write_account_details_to_file(account)
		io_file = File.open(account, 'w+')
		io_file.write(open_account.details)
		io_file.close
	end
	
	def pin_message
		if @pin_counter == 0
			puts "Please enter your PIN or C)ancel"
		else
			puts "PIN incorrect, you have #{3 - @pin_counter} attempts left!"
		end
	end
	
	def request_pin
		if @pin_counter < 3
			pin_message
			user_pin = gets.chomp
		else
			user_pin = "q"
		end
		@pin_counter += 1
		return user_pin
	end
	
	def return_pin
		open_account.pin
	end
	
	
	
	def withdraw_funds
		puts "Enter amount to withdraw"
		amount = gets.chomp
		if amount.valid_float?
			amount = amount.to_f
			if amount > 0 && open_account.check_withdrawal(amount)
				open_account.withdraw(amount)
			elsif amount == 0
				puts "You can\'t withdraw zero, please try again"
			elsif amount < 0
				puts "You can\'t withdraw a negative amount, please try again"
			elsif check_withdrawal(amount) == false
				puts "You don\'t have sufficient funds to make the withdrawal"
			end
		else
			puts "You must enter a number for examle \"10.00\", please try again"
		end
	end
	
	def deposit_funds
		puts "Enter amount to deposit"
		amount = gets.chomp
		if amount.valid_float?
			amount = amount.to_f
			if amount > 0
				open_account.deposit(amount)
			elsif amount == 0
				puts "You can\'t deposit zero, please try again"
			elsif amount < 0
				puts "You can\'t deposit a negative amount, please try again"
			end
		else
			puts "You must enter a number for examle \"10.00\", please try again"
		end
	end
	
	
	
	def print_options
		puts "B)alance   D)eposit   W)ithdraw   Q)uit"
	end
	
	def print_balance
		open_account.show_balance
	end
	

end