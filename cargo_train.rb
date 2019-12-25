class CargoTrain < Train

  def initialize (number_train, type = "cargo")
    super
  end

  def add_car(car)
    if car.instance_of?(CargoTrain)
      super
    end
  end
end
