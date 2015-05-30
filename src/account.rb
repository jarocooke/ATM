#coding: utf-8
class Bank_account
	attr_accessor :account_name, :sort_code, :account_number, :balance, :pin
	
	def initialize(account_info)
		@account_name = account_info[0]
		@sort_code = account_info[1]
		@account_number = account_info[2]
		@balance = account_info[3]
		@pin = account_info[4]
	end
	
	def show_balance
		puts "Account balance: £" + "%.2f" % @balance
	end
	
	def withdraw(amount)
		@balance = @balance.to_f - amount
		@balance = @balance.to_s
		puts "You have withdrawn £#{"%.2f" % amount}"
	end
	
	def deposit(amount)
		@balance = @balance.to_f + amount
		@balance = @balance.to_s
		puts "You have deposited £#{"%.2f" % amount}"
	end
	
	def check_withdrawal(amount)
		amount <= @balance.to_f
	end
	
	def details
		return "#{account_name}\n#{sort_code}\n#{account_number}\n#{balance}\n#{pin}"
	end
	
end