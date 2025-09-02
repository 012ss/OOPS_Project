class Parking_spot
  include PARKING_PRICE
  attr_accessor :vacant,:close_to_exit,:price,:arriving_time,:exit_time,:duration
  @vacant=true
  @duration=nil
  def initialize(vacant,close_to_exit,arriving_time=nil,exit_time=nil)
    @vacant=vacant
    @close_to_exit=close_to_exit
    @arriving_time=arriving_time
    @exit_time=exit_time
    @price=ticket_price(@close_to_exit)
    

    if @arriving_time == nil and @exit_time !=nil
      raise ArgumentError,"Invalid time provided"
    elsif @arriving_time!=nil and @exit_time==nil
      raise ArgumentError,"Invalid time provided"
    elsif @arriving_time<0 || @exit_time<0
      raise ArgumentError, "Invalid time provided"
    end

    @duration=@exit_time-@arriving_time

  end  
end