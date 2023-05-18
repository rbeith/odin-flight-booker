class Flights < ActiveRecord::Migration[7.0]
	def change
		create_table :airports do |t|
			t.string :airport_code
			t.timestamps
		end
		
		create_table :flights do |t|
			t.belongs_to :departure_airport
			t.belongs_to :arrival_airport
			t.datetime :start
			t.integer :duration

			t.timestamps
		end
  end
end