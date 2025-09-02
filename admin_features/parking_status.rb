module Parking_area_status_module
  def parking_area_status
    a = @parking_area.check_vacancy || []
    @current_vacancy = a
  end
end