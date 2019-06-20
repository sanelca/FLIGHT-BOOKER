include ActionView::Helpers::TextHelper
class FlightsController < ApplicationController
  def index
    # @flight = Flight.new
    @airports_options = Airport.all.map{|a| [ "#{a.code}, #{a.name}", a.id ]}
    @num_passenger_options = [1,2,3,4].map{|num| [ pluralize(num, 'person'), num ]}
    @departure_time_options = Flight.departure_time_options
    @num_passengers = params[:num_passengers] unless params[:num_passengers].nil?
    @queried_flights = Flight.queried_flights(params)
  end

  private
    def flight_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_time, :num_passengers)
    end

end
