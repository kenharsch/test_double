class Account < ApplicationRecord
	belongs_to :upload

	before_create :set_values_and_status

	serialize :input, Array

	def set_values_and_status
		self.set_account_string
		self.set_status
	end

	def set_account_string
		string_value = ""
		self.input.each do |arr|
			val = ARR_VALS[arr]
			if val.nil?
				string_value += "?"
			else
				string_value += val.to_s
			end
		end
		self.account_string = string_value
	end

	def set_status
		if !self.all_numbers?(self.account_string)
			val = "ILL"
		elsif !self.valid_checksum?(self.account_string)
			val = "ERR"
		else
			#call replace function
			val = ""
		end
		self.status = val
	end

	def valid_checksum?(account_number)
		ret = false 
		unless self.all_numbers?(account_number)
			int_array = self.split("").map{|c| c.to_i}
			ret = (int_array[0]*9 + int_array[1]*8 + int_array[2]*7 + int_array[3]*6 + int_array[4]*5 + 
				int_array[5]*4 + int_array[6]*3 + int_array[7]*2 + int_array[8])%11 == 0
		end
		return ret
	end

	def all_numbers?(account_number)
		(account_number.length == 9) && (!account_number.include? "?")
	end

	def replace(input_array)
		#takes input array, returns array of valid possibilities
		#this will be a recursive call to check and replace " " with "_" and "|" then check
		#against STRING_VALS 
	end


	#CONSTANTS
	ARR_VALS = {
		[" _ ", "| |", "|_|"]=>0, 
		["   ", "  |", "  |"]=>1, 
		[" _ ", " _|", "|_ "]=>2, 
		[" _ ", " _|", " _|"]=>3, 
		["   ", "|_|", "  |"]=>4, 
		[" _ ", "|_ ", " _|"]=>5, 
		[" _ ", "|_ ", "|_|"]=>6, 
		[" _ ", "  |", "  |"]=>7, 
		[" _ ", "|_|", "|_|"]=>8, 
		[" _ ", "|_|", " _|"]=>9
	} 

	STRING_VALS = {
		" _ | ||_|"=>0, 
		"     |  |"=>1, 
		" _  _||_ "=>2, 
		" _  _| _|"=>3, 
		"   |_|  |"=>4, 
		" _ |_  _|"=>5, 
		" _ |_ |_|"=>6, 
		" _   |  |"=>7, 
		" _ |_||_|"=>8, 
		" _ |_| _|"=>9
	}

end
