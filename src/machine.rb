class Machine
	attr_accessor :account_details
	
	def initialize
		@account_details = []
		#@open_account = open_account
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
	end

	def load_default_account_details
		account_details[0] = "J Cooke"
		account_details[1] = "04-98-27"
		account_details[2] = "87302945"
		account_details[3] = "100.00"
		account_details[4] = "1111"
	end
	
#	def create_account_obj
#		open_account = Bank_account.new(account_details[0], account_details[1], account_details[2], account_details[3], account_details[4])
#	end

end