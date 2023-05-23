# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

		Airport.create!([
			{ airport_code: "LHR" },
			{ airport_code: "CDG" },
			{ airport_code: "SYD" },
			{ airport_code: "PEK" },
			{ airport_code: "MEX" },
			{ airport_code: "ICN" },
			{ airport_code: "YVR" },
			{ airport_code: "BKK" },
			{ airport_code: "MAD" },
			{ airport_code: "SFO" },
			{ airport_code: "SEA" },
			{ airport_code: "HKG" },
			{ airport_code: "JFK" }
		])

		1000.times do |i|
			Flight.create!(departure_airport_id: rand(1..13), 
										 arrival_airport_id: rand(1..13),
										 start: rand(Time.now..1.week.from_now.to_time),
										 duration: rand(10.hours))
		end

		Flight.where('departure_airport_id = arrival_airport_id').map(&:destroy)