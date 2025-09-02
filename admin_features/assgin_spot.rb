module Assign_spot_module
  
  def select_spot_and_assign
   if @current_vacancy.size != 0
     @parking_area.assign_spot(@current_vacancy[0])
     spot = @current_vacancy[0]
    #  puts "This our current vacacy.. #{@current_vacancy[0]}"
     final_price = 0
     case @parking_area.check_occupancy
     when "L"
      final_price = @current_vacancy[0][:price]
     when "M"
      final_price = @current_vacancy[0][:price] + 100
     when "H"
      final_price = @current_vacancy[0][:price] + 300
     end

     @current_vacancy.delete(@current_vacancy[0])
     
     final_price
    else
      "There is no spot vacant for you deeply soory!!"
   end
   
  end
end