class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains= []
    @@stations << self
    instances_quantity
  end

  #Принимает поезда
  def take_train(train)
    @trains << train
  end

  #Отправляет поезда
  def send_train(train)
    @trains.delete(train)
    train.stations = nil
  end


  #Возращает список грузовых и пассажирских поездов
  def list_trains_type (type)
    @trains.each { |train| puts train if train.type == type}
  end

end
