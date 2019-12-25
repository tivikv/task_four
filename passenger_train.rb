class PassengerTrain < Train

  attr_reader :cars

  def initialize (number_train, type = 'passenger')
    super
  end

 #прицепляет только пассажирские вагоны
 def add_car(car)
  if car.instance_of?(PassengerCar)
    super
  end
end

end
