module Select_spot_module
  
  def select_spot_and_assign
   if @current_vacancy.size != 0
     @parking_area.assign_spot(@current_vacancy[0])
     spot = @current_vacancy[0]
     final_price = 0
     case @parking_area.check_occupancy
     when "l"
      final_price = spot.price
     when "m"
      final_price = spot.price + 100
     when "h"
      final_price = spot.price + 300
     end
     final_price
   end
  end
end