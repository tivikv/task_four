class Station
  include InstanceCounter
  attr_reader :name, :trains

  NAME_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]+$/

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains= []
    @@stations << self
    instances_quantity
    validate!
  end

  def validate?
    validate!
  rescue
    false
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

  protected

  def validate!
    raise "Название станции должно быть указано" if name.nil?
    raise "Название станции не может иметь больше 100 символов" if name.length > 100
    raise "Некорректное название станции" if name !~ NAME_FORMAT
  end

end
