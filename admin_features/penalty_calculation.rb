module Penalty_calculation_moudle
  def check_for_penalty(id)
      penalty = "There is no Penalty"
      @parking_area.set_exit_time(id)
      spot = @parking_area.get_spot_by_id(id)
      requested_duration = spot[:duration]

      actual_duration = spot[:exit_time].to_i - spot[:arriving_time].to_i

      real_price = spot[:price]
      
      if requested_duration < actual_duration
        # there is a fine
        penalty_time = actual_duration - requested_duration
        penalty = penalty_time*(real_price + 100)
      end
      penalty
  end
end