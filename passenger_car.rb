class PassengerCar < Car

  attr_reader :seat, :selected_seat

  def initialize (seat)
    @seat = seat
    @selected_seat = 0
  end

  def take_seat
   if (@seat - @selected_seat) > 0
    @selected_seat += 1
  else
    puts "Нет свободного места"
  end
end

def free_seat
  @seat - @selected_seat
end

def busy_seat
  @selected_seat
end

end
