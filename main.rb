require_relative "admin.rb"
require_relative "parking_area.rb"
# require_relative "parking_spot.rb"

parking_area = ParkingArea.new
# p parking_area
admin = Admin.new(parking_area)
puts admin.parking_area_status
p admin.select_spot_and_assign
admin.release