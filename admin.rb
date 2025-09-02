require_relative "admin_features/parking_status"
require_relative "admin_features/assgin_spot"
require_relative "admin_features/penalty_calculation"
require_relative "admin_features/release_spot"


class Admin
  include Parking_area_status_module
  include Assign_spot_module
  include Penalty_calculation_moudle
  include Release_spot_module
  def initialize(parking_area)
    @name = "Admin"
    @parking_area = parking_area
    @current_vacancy = []
  end
  
end
