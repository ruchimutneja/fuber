require 'test_helper'

class UserTest < ActiveSupport::TestCase
	describe Link do
		it { should belong_to(:location) }
	end
end
