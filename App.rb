# vacancy checking(number of vacant spots)
# Select the spot
# User will select id
# You have to pay(price)
# Please tell your release id 
# Let me check if you have any penalties
require 'json'
require_relative "admin.rb"
require_relative "parking_area.rb"
require_relative "parking_spot.rb"

json_data=File.read('parking.json')
DATA=JSON.parse(json_data,symbolize_names:true)

def parking_cli
  parking_area = ParkingArea.new
admin = Admin.new(parking_area)
  loop do
    puts "Hey Pls select Your option "
    puts "1.View Parking Area"
    puts "2. Assign Slot"
    puts "3. Release Slot"
    puts "4. Exit"

    input=gets.chomp.to_i
    case input
    when 1
      parking_area.real_time_spots
    when 2
      puts "Enter the id to book spot"
      id=gets.chomp.to_i
      puts "Enter the duration you wish to park your vehicle"
      duration = gets.chomp.to_i
      price= admin.assign_spot(id,duration)
      parking_area.real_time_spots
      puts ""
      puts "You have to pay price =#{price}"
    when 3

      puts "Let me check if there is any penalty"
      puts "Enter id to check the penalty"
      id=gets.chomp.to_i
      penalty=admin.check_for_penalty(id)
      puts "your penalty is #{penalty}"
      admin.release(id)
      puts "Your spot have been released"
      parking_area.real_time_spots
    when 4
      puts "You are extting the application.."
      break
    end
  end
end

parking_cli