class Account < ApplicationRecord
	belongs_to :upload

	before_create :set_values_and_status

	serialize :input, Array

	def set_values_and_status
		self.set_account_string
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

	ARR_MAP = {
		0=>[" _ ", "| |", "|_|"], 
		1=>["   ", "  |", "  |"], 
		2=>[" _ ", " _|", "|_ "], 
		3=>[" _ ", " _|", " _|"], 
		4=>["   ", "|_|", "  |"], 
		5=>[" _ ", "|_ ", " _|"], 
		6=>[" _ ", "|_ ", "|_|"], 
		7=>[" _ ", "  |", "  |"], 
		8=>[" _ ", "|_|", "|_|"], 
		9=>[" _ ", "|_|", " _|"]
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
