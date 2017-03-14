require 'test_helper'

class CabTest < ActiveSupport::TestCase

	describe Link do
		it { should belong_to(:location) }
	end

	test "should return available cabs with given color" do 
		cab1 = Cab.new(color: 'pink', availability: true)
		cab2 = Cab.new(color: 'red', availability: false)
		cab3 = Cab.new(color: 'red', availability: true)

		available_red_color_cab = Cab.available_cabs_with("red")

		assert(available_red_color_cab, [cab3])
		Cab.delete_all
	end

	test "it should not return non-available cabs" do
		cab1 = Cab.new(color: 'pink', availability: true)
		cab2 = Cab.new(color: 'red', availability: false)

		available_red_color_cab = Cab.available_cabs_with("red")

		assert_not(available_red_color_cab, [cab2])
	end

	test "should have color attribute of the cab" do
		cab = Cab.new(availability: true)
		assert_not cab.valid?
		assert_equal ["is not a number"], cab.errors.messages[:color]
	end

	test "should have availability with boolean value" do
		cab = Cab.new(availability: "df")
		assert_not cab.valid?
		assert_equal ["is not a boolean"], cab.errors.messages[:availability]
	end
end
