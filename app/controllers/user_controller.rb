class UserController < ApplicationController

	def assign_cab
		assigned_cab = Cab.find_nearest_cab(@user.pickup_location)
		return"no cab available" if cab.nil?
		return assigned_cab
	end

	def end_ride
		release_user_cab @user.drop_location
	end
end
