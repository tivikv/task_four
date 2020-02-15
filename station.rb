class Station
  require_relative 'modules.rb'
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
    validate!
    @@stations << self
    instances_quantity
  end

  def valid?
    validate!
    true
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
   station_name?
   station_size?
   correct_name?
 end

 def station_name?
   raise "Название станции должно быть указано" if name.nil?
 end

 def station_size?
  raise "Название станции не может иметь больше 100 символов" if name.length > 100
end

def correct_name?
  raise "Некорректное название станции" if name !~ NAME_FORMAT
end

def train_on_station (&block)
  return "Нет блока" unless block_given?
  @trains.each { |train| yield(train) }
end

end
