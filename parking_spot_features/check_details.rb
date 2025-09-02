module CHECK_DETAILS
  def check_vacant(parking_spot_object)
    parking_spot_object.vacant ? "You can park here" : "You cannot park here"
  end

  def check_duration(parking_spot_object)
    if parking_spot_object.duration!=nil
      parking_spot_object.duration
    else 
      "This spot is vacant"
    end
  end

  def check_price(parking_spot_object)
    parking_spot_object.price
  end

end