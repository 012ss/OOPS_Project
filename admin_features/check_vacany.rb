module Check_vacancy
  def Check_vacancy
    a = @parking_area.check_vacancy

    if a.size == 0
      puts "Sorry There is No Spot for you "
    end
    
    @available_spots = a
  end
end