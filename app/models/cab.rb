class Cab < ApplicationRecord
	belongs_to :location
	validates :color, presence: true
	validates :availability, inclusion: { in: [ true, false ] }

	def self.available_cabs_with color
		Cab.where(color: color,availability: true)
	end

	def self.find_nearest_cab user_location, user_color_preference
		nearest_cab = nil

		all_user_preferred_color_cabs = available_cabs_with(user_color_preference)
		
		if all_user_preferred_color_cabs.any?
			nearest_cab = cab_with_min_distance_from(user_location, all_user_preferred_color_cabs)
			nearest_cab.availability = false
		end 
		nearest_cab
	end

	def release_user_cab user_location
		cab.location = user_location
		cab.availability = true
	end

	private
	def cab_with_min_distance_from user_location, cabs
		all_cab_with_distances_from_user = {}
		cabs.each do |cab|
			all_cab_with_distances_from_user[cab] = Location.calculate_distance(cab.location, user_location)
		end 
		all_cab_with_distances_from_user.min.key
	end
end
