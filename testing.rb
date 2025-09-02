require_relative "admin.rb"
require_relative "parking_area.rb"
require_relative "parking_spot.rb"

parking_area = ParkingArea.new
admin = Admin.new(parking_area)
puts admin.assign_spot(1,10)

puts admin.assign_spot(2,20)
puts admin.check_for_penalty(2)
puts admin.release(2)
puts admin.check_vacancy
