class Driver < ActiveRecord::Base
	#an array containing items for a selection list of Gender field
	GENDER_TYPE = [
		#Displayed text		stored in db
		["Female",		"F"],
		["Male",		"M"]
	]
	

	attr_accessible 		:employeeId, :fname, :lname, :gender, :mobileNum
	
	validates_presence_of 	:employeeId, :fname, :lname,:gender
	validates_uniqueness_of :employeeId
	validates_inclusion_of 	:gender, :in => GENDER_TYPE.map {|disp,value|value}
	#need to validate mobile number as well in terms of format
	
	has_many :tripLogs
	
end
