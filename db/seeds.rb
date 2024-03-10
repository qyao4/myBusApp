# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Populate the 'drivers' table with 30 entries.(faker)
# 30.times do
#   Driver.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     phone_number: Faker::PhoneNumber.phone_number
#   )
# end

# Populate the 'routes' table with 10 entries.(API)
# require 'net/http'
# require 'json'
# require 'uri'

# route_keys = ["BLUE", "642", "650", "691", "694", "47", "74","16","18","31"]

# route_keys.each do |route_key|
#   url = URI("https://api.winnipegtransit.com/v3/routes/#{route_key}.json?api-key=aaitNO7SFcfMFhmbrg-u")
#   response = Net::HTTP.get(url)
#   result = JSON.parse(response)

#   route_data = result['route']

#   Route.create!(
#     number: route_data['number'],
#     customer_type: route_data['customer-type'],
#     coverage: route_data['coverage']
#   )
# end

# Populate the 'drivers_routes' table with csv
# require 'csv'

# csv_text = File.read(Rails.root.join('db', 'drivers_routes.csv'))
# csv = CSV.parse(csv_text, headers: true)
# csv.each do |row|
#   driver_id = row['driver_id']
#   route_id = row['route_id']

#   driver = Driver.find_by(id: driver_id)
#   route = Route.find_by(id: route_id)

#   if driver && route
#     driver.routes << route unless driver.routes.include?(route)
#   else
#     puts "Driver or Route not found: Driver ID = #{driver_id}, Route ID = #{route_id}"
#   end
# end

# puts "Imported drivers_routes associations from CSV"


# Populate the 'stops' table based on 10 routes.(API)
# require 'net/http'
# require 'json'
# require 'uri'

# route_keys = ["BLUE", "642", "650", "691", "694", "47", "74","16","18","31"]

# route_keys.each do |route_key|
#   url = URI("https://api.winnipegtransit.com/v3/stops.json?api-key=aaitNO7SFcfMFhmbrg-u&route=#{route_key}")
#   response = Net::HTTP.get(url)
#   result = JSON.parse(response)

#   stop_datas = result['stops']

#   stop_datas.each do |stop_data|
#     Stop.create!(
#       key: stop_data['key'],
#       name: stop_data['name'],
#       street: stop_data['street']['name'],
#       latitude: stop_data['centre']['geographic']['latitude'],
#       longitude: stop_data['centre']['geographic']['longitude']
#     )
#   end
# end


# Populate the 'schedules' table based on routes and stops.(API)
# require 'net/http'
# require 'json'
# require 'uri'
# Stop.find_each do |stop|
#   url = URI("https://api.winnipegtransit.com/v3/stops/#{stop.key}/schedule.json?api-key=aaitNO7SFcfMFhmbrg-u&start=2024-03-03T10:00:00&end=10:30:00&route=BLUE,650,642,691,694,47,16,18,31")
#   response = Net::HTTP.get(url)
#   result = JSON.parse(response)
#   route_schedules = result['stop-schedule']['route-schedules']

#   route_schedules.each do |route_schedule|
#     route_number = route_schedule["route"]["number"]
#     route = Route.find_by(number: route_number)

#     if route
#       scheduled_stops = route_schedule['scheduled-stops']

#       scheduled_stops.each do |scheduled_stop|
#         if scheduled_stop['times'] && scheduled_stop['times']['arrival'] && scheduled_stop['times']['arrival']["scheduled"]
#           arrival = scheduled_stop['times']['arrival']["scheduled"][-8..-1]
#         end

#         if scheduled_stop['times'] && scheduled_stop['times']['departure'] && scheduled_stop['times']['departure']["scheduled"]
#           departure = scheduled_stop['times']['departure']["scheduled"][-8..-1]
#         end

#         # puts "arrival #{arrival} departure #{departure}"

#         if arrival && departure
#           Schedule.create!(
#             stop_id: stop.id,
#             route_id: route.id,
#             arrival: arrival,
#             departure: departure
#           )
#         end

#       end

#     else
#       puts "Failed to find route number #{route_number} for stop #{stop.key}"
#     end

#   end
# end
