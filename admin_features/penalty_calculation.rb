module Penalty_calculation_moudle
  def penalty(spot,relasesd_at)
    requested_duration = spot.duration
    extra_duration = relasesd_at - spot.arriving_time
    final_penalty = 0
    if requested_duration < actual_duration
      extra_duration*(spot.price + 50)
    end
    final_penalty
  end
end