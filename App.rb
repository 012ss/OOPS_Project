# vacancy checking(number of vacant spots)
# Select the spot
# User will select id
# You have to pay(price)
# Please tell your release id 
# Let me check if you have any penalties
require 'json'
require_relative "parking_area.rb"
require_relative "admin"


json_data=File.read('parking.json')
DATA=JSON.parse(json_data,symbolize_names:true)




def parking_cli
  loop do
    puts "1.View Parking Area"
    puts "2. Assign Slot"
    puts "3. Release Slot"
    puts "4. Exit"

    input=gets.chomp.to_i
    case input
    when 1
      real_time_spots
    when 2
      price=select_spot_and_assign
      puts "You have to pay price =#{price}"
    when 3

      puts "Your spot have been released"
      real_time_spots
    when 4
      break
    end
  end
end







