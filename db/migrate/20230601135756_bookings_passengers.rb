class BookingsPassengers < ActiveRecord::Migration[7.0]
  def change
		create_table :bookings_passengers, id: false do |t|
			t.belongs_to :passenger
			t.belongs_to :booking
		end
  end
end
