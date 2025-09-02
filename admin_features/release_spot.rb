module Release_spot_module
  def release
    @parking_area.release_spot(@current_vacancy[0])
    
    puts ""
  end
end