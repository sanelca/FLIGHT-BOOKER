# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Airport.create!(name: "Los Angeles International Airport", code: "LAX")
Airport.create!(name: "Logan International Airport", code: "BOS")
Airport.create!(name: "Chicago Midway International Airport", code: "MDW")
Airport.create!(name: "Dallas/Fort Worth International Airport", code: "DFW")
Airport.create!(name: "Indianapolis International Airport", code: "IND")
Airport.create!(name: "Miami International Airport", code: "MIA")
Airport.create!(name: "John F. Kennedy International Airport", code: "JFK")
Airport.create!(name: "Salt Lake City International Airport", code: "SLC")
Airport.create!(name: "Seattle-Tacoma International Airport", code: "SEA")

Flight.create!(departure_airport_id: 1, arrival_airport_id: 2, departure_time: 3.days.from_now, duration: 6)
Flight.create!(departure_airport_id: 1, arrival_airport_id: 3, departure_time: 4.days.from_now, duration: 4)
Flight.create!(departure_airport_id: 1, arrival_airport_id: 4, departure_time: 3.days.from_now, duration: 4)
Flight.create!(departure_airport_id: 1, arrival_airport_id: 5, departure_time: 4.days.from_now, duration: 5)
Flight.create!(departure_airport_id: 1, arrival_airport_id: 6, departure_time: 5.days.from_now, duration: 6)
Flight.create!(departure_airport_id: 1, arrival_airport_id: 7, departure_time: 5.days.from_now, duration: 6)
Flight.create!(departure_airport_id: 1, arrival_airport_id: 8, departure_time: 4.days.from_now, duration: 3)
Flight.create!(departure_airport_id: 1, arrival_airport_id: 9, departure_time: 3.days.from_now, duration: 3)

Flight.create!(departure_airport_id: 2, arrival_airport_id: 1, departure_time: 5.days.from_now, duration: 6)
Flight.create!(departure_airport_id: 3, arrival_airport_id: 1, departure_time: 5.days.from_now, duration: 4)
Flight.create!(departure_airport_id: 4, arrival_airport_id: 1, departure_time: 5.days.from_now, duration: 4)
