#require 'rubygems'
#require 'debugger'

#require_relative 'src/account'
require_relative 'src/machine'

#Find out if a string can be converted into a valid float
class String
	def valid_float?
		true if Float self rescue false
	end
end


my_machine = Machine.new('bank_account_details.txt')

user_pin = my_machine.request_pin

while user_pin != my_machine.return_pin && user_pin.downcase != "c" && user_pin.downcase != "q"
	user_pin = my_machine.request_pin
end

if user_pin == "c"
	my_machine.quit
elsif user_pin == "q"
	puts "You\'ve entered your PIN incorrectly too many times - exiting"
	my_machine.quit
end

loop do
	my_machine.print_options
	case gets.chomp.downcase.to_sym
	when :b
		my_machine.print_balance
	when :d
		my_machine.deposit_funds
		my_machine.print_balance		
	when :w
		my_machine.withdraw_funds
		my_machine.print_balance
	when :q
		my_machine.quit
	else
		puts "Not a valid command, please try again."
	end
end
