module Assign_spot_module
  def assign_spot(id,duration)
    @parking_area.assign_spot(id,duration)
    spot = @parking_area.get_spot_by_id(id)
    occupancy = @parking_area.check_occupancy
      price = spot[:price]
    case occupancy
    when "L"
      price += 0
    when "M"
      price += 100
    when "H"
      price += 200
    end
    price
  end
end