class Car < ActiveRecord::Base
	attr_accessible 		:regNum, :model, :carType, :colour

	validates_presence_of 	:regNum, :model, :carType
	validates_length_of 	:regNum, :in => 2..8, :message => "Must have between 2 and 8 characters"
	validates_uniqueness_of :regNum 
	validates_format_of		:regNum, :with => /([a-z]+\s*\d+)|(\d+\s*[a-z]+)/i, 
									 :message => "Must have atleast one letter and one digit"

	has_many :tripLogs

end
