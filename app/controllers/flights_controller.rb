include ActionView::Helpers::TextHelper
class FlightsController < ApplicationController
  def index
    # @flight = Flight.new
    @airports_options = Airport.all.map{|a| [ "#{a.code}, #{a.name}", a.id ]}
    @num_passenger_options = [1,2,3,4].map{|num| [ pluralize(num, 'person'), num ]}
    @departure_time_options = Flight.select(:departure_time).group('DATE(departure_time)')
                                    .map{ |f| [ f.date_formatted, f.departure_time.to_date ]}

    @num_passengers = params[:num_passengers] unless params[:num_passengers].nil?
    @queried_flights = []
    if !params[:departure_airport_id].nil?
      @queried_flights = Flight.all
      @queried_flights = @queried_flights.where(departure_airport_id: params[:departure_airport_id])
      @queried_flights = @queried_flights.where(arrival_airport_id: params[:arrival_airport_id])
      @queried_flights = @queried_flights.where("DATE(departure_time) = ?", params[:departure_time].to_date)
    end
  end

  private
    def flight_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_time, :num_passengers)
    end

end
