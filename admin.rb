require_relative "admin_features/parking_status"
require_relative "admin_features/assgin_spot"
require_relative "admin_features/release_spot"


class Admin
  include Check_vacancy
  include Assign_spot_module
  include Release_spot_module
  include Penalty_calculation_moudle
  def initialize(parking_area)
    @name = "Admin"
    @parking_area = parking_area
    @available_spots = []
  end
  
end
