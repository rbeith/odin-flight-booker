class AddPassengersToFlights < ActiveRecord::Migration[7.0]
  def change
		add_column :flights, :passengers, :integer
  end
end
