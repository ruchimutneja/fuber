require 'test_helper'

class LocationTest < ActiveSupport::TestCase
   test "it should calculate distance between two locations" do
   	location1 = Location.create(latitude: 1, longitude: 1)
   	location2 = Location.create(latitude: 4, longitude: 5)

	distance = Location.calculate_distance(location1,location2)
    
    assert(distance, 5.0)
   end
end
