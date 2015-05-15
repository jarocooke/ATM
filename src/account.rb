#coding: utf-8
class Bank_account
	attr_accessor :account_name, :sort_code, :account_number, :balance, :pin
	
	def initialize(account_name, sort_code, account_number, balance, pin)
		@account_name = account_name
		@sort_code = sort_code
		@account_number = account_number
		@balance = balance
		@pin = pin
	end
	
	def show_balance
		puts "Account balance: £" + "%.2f" % @balance
	end
	
	def withdraw_funds
		puts "Enter amount to withdraw"
		amount = gets.chomp
		if amount.valid_float? == true
			amount = amount.to_f
			if amount > 0 && amount <= @balance.to_f
				@balance = @balance.to_f - amount
				@balance = @balance.to_s
				puts "You have withdrawn £#{"%.2f" % amount}"
				$user_option = :continue
			elsif amount == 0
				puts "You can\'t withdraw zero, please try again"
			elsif amount < 0
				puts "You can\'t withdraw a negative amount, please try again"
			elsif amount > @balance.to_f
				puts "You don\'t have sufficient funds to make the withdrawal"
			end
		else
			puts "You must enter a number for examle \"10.00\", please try again"
		end
	end
	
	def deposit_funds
		puts "Enter amount to deposit"
		amount = gets.chomp
		if amount.valid_float? == true
			amount = amount.to_f
			if amount > 0
				@balance = @balance.to_f + amount
				@balance = @balance.to_s
				puts "You have deposited £#{"%.2f" % amount}"
				$user_option = :continue
			elsif amount == 0
				puts "You can\'t deposit zero, please try again"
			elsif amount < 0
				puts "You can\'t deposit a negative amount, please try again"
			end
		else
			puts "You must enter a number for examle \"10.00\", please try again"
		end
	end
	
end