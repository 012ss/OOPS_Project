module Penalty_calculation_moudle
  def check_for_penalty(id)
      penalty = "There is no Penalty"
      spot = get_spot_by_id(id)
      @parking_area.set_exit_time(id)

      requested_duration = spot[:duration]

      actual_duration = spot[:exit_time] - spot[:arriving_time]

      real_price = spot[:price]
      
      if requested_duration < actual_duration
        # there is a fine
        penalty_time = actual_duration - requested_duration
        penalty = penalty_time*(real_price + 100)
      end
      penalty
  end
end