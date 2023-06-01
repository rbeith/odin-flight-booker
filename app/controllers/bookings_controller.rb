class BookingsController < ApplicationController
	def new
		@flight = Flight.find(booking_params[:flight][:id])
		@booking = @flight.create_booking(number_of_passengers: booking_params[:flight][:passengers].to_i)
		
		@booking.number_of_passengers.to_i.times { @booking.passengers.create }
	
	end
  
	def update
	
	end
	
	def show
		@booking = Booking.find(booking_params[:id])
	end

	def create
		@booking = Booking.find(params[:format])

		@booking.passengers.each_with_index do |passenger, index|
			passenger.update(name: passenger_params[:passengers_attributes][index.to_s][:name],
										  email: passenger_params[:passengers_attributes][index.to_s][:email] )
		end

		if @booking.save
			redirect_to booking_path(@booking)
		else 
			render "new"
		end

	end

	private

	def booking_params
		params.permit(:id, :commit, flight: [:id, :passengers])
	end

	def passenger_params
		params.require(:booking).permit(:id, passengers_attributes: [:name, :email, :id])
	end
end
