#require 'rubygems'
#require 'debugger'

#Creates bank account object to be manipulated
require_relative 'src/account'

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

open_account = Bank_account.new(my_machine.account_details)




#Load account details from file
#account_details = []
#if File.exist?('bank_account_details.txt') == true
#	io_file = File.open('bank_account_details.txt', 'r')
#	io_file.each_line do |line|
#		account_details << line.chomp
#	end
#	io_file.close
#else
#	io_file = File.open('bank_account_details.txt', 'w+')
#end

#debugger

#Default info if file doesn't exist
#if account_details == []
#	account_details[0] = "J Cooke"
#	account_details[1] = "04-98-27"
#	account_details[2] = "87302945"
#	account_details[3] = "100.00"
#	account_details[4] = "1111"
#end

#Create Bank_account object
#open_account = Bank_account.new(account_details[0], account_details[1], #account_details[2], account_details[3], account_details [4])

#Check users PIN
puts "Please enter your PIN or C)ancel"
user_pin = gets.chomp
incorrect_pin_counter = 0

while incorrect_pin_counter < 2 && user_pin != open_account.pin && user_pin.downcase != "c"
	incorrect_pin_counter += 1
	puts "PIN incorrect, you have #{3 - incorrect_pin_counter} attempts left!"
	puts "Please enter your PIN or C)ancel"
	user_pin = gets.chomp
end
	
if user_pin.downcase == "c"
	exit
elsif incorrect_pin_counter == 2
	puts "You\'ve entered your PIN incorrectly too many times - exiting"
	exit
end


$user_option = :continue
while $user_option != :q
	if $user_option == :continue
		puts "B)alance   D)eposit   W)ithdraw   Q)uit"
		$user_option = gets.chomp.downcase.to_sym
	end
	if $user_option == :b
		open_account.show_balance
		$user_option = :continue
	elsif $user_option == :d
		open_account.deposit_funds
		open_account.show_balance
	elsif $user_option == :w
		open_account.withdraw_funds
		open_account.show_balance
	elsif $user_option != :q
		puts "Not a valid command, please try again."
		$user_option = :continue
	end
end


#Write new account details to file

my_machine.write_account_details_to_file(account_file, open_account.populate_account_details)


#io_file = File.open('bank_account_details.txt', 'w+')
#io_file.write("#{open_account.account_name}\n#{open_account.sort_code}\n#{open_account.account_number}\n#{open_account.balance}\n#{open_account.pin}")
#io_file.close


