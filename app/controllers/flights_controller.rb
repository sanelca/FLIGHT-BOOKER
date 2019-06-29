include ActionView::Helpers::TextHelper
class FlightsController < ApplicationController
  def index
    # @flight = Flight.new
    @num_passengers = params[:num_passengers] unless params[:num_passengers].nil?
    @queried_flights = Flight.queried_flights(params)
  end

  private
    def flight_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_time, :num_passengers)
    end

end
