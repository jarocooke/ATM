require 'rubygems'
require 'debugger'



#Machine handles loading of bank details and starting and finishing
require_relative 'src/machine'

require_relative 'src/user'

#Find out if a string can be converted into a valid float
class String
	def valid_float?
		true if Float self rescue false
	end
end


my_machine = Machine.new

account_file = 'bank_account_details.txt'
my_machine.load_account_details(account_file)

#open_account = Bank_account.new(my_machine.account_details)


user_pin = my_machine.request_pin

while user_pin != my_machine.return_pin && user_pin.downcase != "c" && user_pin.downcase != "q"
	user_pin = my_machine.request_pin
end

if user_pin == "c"
	exit
elsif user_pin == "q"
	puts "You\'ve entered your PIN incorrectly too many times - exiting"
	exit
end


$user_option = :continue
while $user_option != :q
	if $user_option == :continue
		my_machine.print_options
		$user_option = gets.chomp.downcase.to_sym
	end
	if $user_option == :b
		my_machine.print_balance
		$user_option = :continue
	elsif $user_option == :d
		my_machine.deposit_funds
		my_machine.print_balance
	elsif $user_option == :w
		my_machine.withdraw_funds
		my_machine.print_balance
	elsif $user_option != :q
		puts "Not a valid command, please try again."
		$user_option = :continue
	end
end


#Write new account details to file
my_machine.write_account_details_to_file(account_file)



