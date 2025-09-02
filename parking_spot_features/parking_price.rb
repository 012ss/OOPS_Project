module PARKING_PRICE
  BASE_PRICE=100
  RATE=0.4
  @ticket_price=nil
  def ticket_price(level)
    
    @ticket_price=(BASE_PRICE * ((1 + RATE) ** (4 - level))).round
  end

end