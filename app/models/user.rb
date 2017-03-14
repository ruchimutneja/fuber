class User < ApplicationRecord
	belongs_to :pickup_location, :class_name => "Location", :foreign_key => :pickup_location_id
	belongs_to :drop_location, :class_name => "Location", :foreign_key => :drop_location_id
end 