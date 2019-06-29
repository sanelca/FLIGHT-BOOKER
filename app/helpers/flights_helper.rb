module FlightsHelper
  def airports_options
    return Airport.all.map{|a| [ "#{a.code}, #{a.name}", a.id ]}
  end

  def num_passenger_options
    return [1,2,3,4].map{|num| [ pluralize(num, 'person'), num ]}
  end

  def departure_time_options
    return Flight.departure_time_options
  end
end
