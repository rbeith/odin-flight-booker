class Booking < ApplicationRecord
	has_one :flight
	has_and_belongs_to_many :passengers

	accepts_nested_attributes_for :passengers
end
