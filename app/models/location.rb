class Location < ApplicationRecord
	attr_accessor :latitude, :longitude


	def self.calculate_distance location1, location1
		Math.sqrt((location1.latitude - location2.latitude)*(location1.latitude - location2.latitude) + 
			(location1.longitude - location2.longitude)*(location1.longitude - location2.longitude))
	end
end
