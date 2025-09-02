require_relative "admin_features/parking_status"

class Admin
  include Parking_area_status
  def initialize(parking_area = [])
    @name = "Admin"
    @parking_area = parking_area
    @current_vacancy = []
  end
end

admin = Admin.new
admin.parking_area_status