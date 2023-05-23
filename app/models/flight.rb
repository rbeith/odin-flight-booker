class Flight < ApplicationRecord
	belongs_to :departure_airport, class_name: "Airport"
	belongs_to :arrival_airport, class_name: "Airport"

	def date_in_words
		start.to_fs(:long)
	end
end
