class FlightsController < ApplicationController

	def index		
		@day = Flight.all.map { |d| [d.start.to_date, d.id ] }.uniq.sort
		@airports = Airport.all.map { |a| [a.airport_code, a.id] }.uniq.sort
	end
	
	def show
		date = Date.civil(flight_params[:date][:year].to_i, flight_params[:date][:month].to_i, flight_params[:date][:day].to_i)
		@flight = Flight.where(start: date.all_day).where(departure_airport: flight_params[:departure_airport]).where(arrival_airport: flight_params[:arrival_airport])
		@passengers = flight_params[:passengers]
	end

	private

	def flight_params
		params.permit(:commit, :departure_airport, :arrival_airport, :passengers, :start, :id, :date => [:year, :month, :day])
	end
end
