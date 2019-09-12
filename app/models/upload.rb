class Upload < ApplicationRecord
	has_many :accounts
	has_one_attached :file

	def process_file
		#assumes proper format
		#TODO - validate format, error handling
		h={}
		attached_file = self.get_file #.download#ActiveStorage::Blob.service.send(:path_for, file.key)
		File.foreach(attached_file).each_slice(4) do |lines|
			first = []
			second = []
			third = []
			i = 1
			lines.each do |l|
				case i
				when 1
					first = l.scan(/.../)
				when 2
					second = l.scan(/.../)
				when 3
					third = l.scan(/.../)
				when 4
					break
				end
				i += 1		
			end
			self.accounts.create(input: first.zip(second,third))
		end
	end

	def get_file
		ActiveStorage::Blob.service.send(:path_for, self.file.key)
	end

	
end
