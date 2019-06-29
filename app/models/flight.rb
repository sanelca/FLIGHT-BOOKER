class Flight < ApplicationRecord
  belongs_to :departure_airport, :class_name => "Airport"
  belongs_to :arrival_airport, :class_name => "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def date_formatted
    departure_time.strftime("%m/%d/%Y")
  end

  def self.departure_time_options
    return Flight.select(:departure_time).group('DATE(departure_time)')
                                    .map{ |f| [ f.date_formatted, f.departure_time.to_date ]}
  end

  def self.queried_flights departure_params
    queried_flights = []
    if !departure_params[:departure_airport_id].nil?
      queried_flights = Flight.all
      queried_flights = queried_flights.where(departure_airport_id: departure_params[:departure_airport_id])
      queried_flights = queried_flights.where(arrival_airport_id: departure_params[:arrival_airport_id])
      queried_flights = queried_flights.where("DATE(departure_time) = ?", departure_params[:departure_time].to_date)
    end
    return queried_flights
  end
end
