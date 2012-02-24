class TripLog < ActiveRecord::Base
  belongs_to :car
  belongs_to :driver

	validates_presence_of     :tripDate, :locationFrom, :locationTo, :departureTime, :arrivalTime, :mileageFrom, :mileageTo
	validates_numericality_of :mileageFrom, :only_integer => true
	validates_numericality_of :mileageTo, :only_integer => true
end
