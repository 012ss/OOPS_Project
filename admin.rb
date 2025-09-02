require_relative "admin_features/check_vacany"
require_relative "admin_features/assign_spot"
require_relative "admin_features/release_spot"
require_relative "admin_features/penalty_calculation"

class Admin
  include Check_vacancy
  include Assign_spot_module
  include Release_spot_module
  include Penalty_calculation_moudle
  def initialize(parking_area)
    @name = "Admin"
    @parking_area = parking_area
  end
  
end
