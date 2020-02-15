class Train
 require_relative 'modules.rb'
 include Company
 include InstanceCounter

 NUMBER_TRAIN_FORMAT = /^[\w\d]{3}-?[\w\d]{2}$/i

  #TYPE = [:passenger, :cargo]
  @@trains = {}

  attr_reader :speed, :type, :route, :number_train, :cars

  def initialize(number_train, type, cars = [])
    @number_train = number_train
    @type = type
    @cars = cars
    @speed = 0
    validate!
    @@trains[self.number_train] = self
    instances_quantity
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  #Метод класса
  def self.find(number_train)
    @@trains[number_train]
  end

  #Возвращает текущую скорость
  def current_speed
    @speed
  end

  #Тормозит
  def stop
    @speed = 0
  end

  #Прицепляет вагоны
  def add_car(car)
    #puts "скорость #{@speed}"
    #puts "#{type_is_train_type?(car)}"
    if @speed == 0 && type_is_train_type?(car)
      @cars << car
    end
  end

  def type_is_train_type?(car)
    #puts "тип поезда#{self.type}"
    #puts "тип вагона#{car.type}"
    self.type == car.type
  end

  #Отцепляет вагоны
  def delete_car
    if @speed == 0
      @cars.last.delete
    end
  end

  #Принимает маршрут следования и поезд автоматически помещается на первую станцию
  def route=(route)
    route.stations.first.take_train(self)
    @route = route
    @index_stations = 0
  end

  #Поезд движется на одну станцию вперед
  def move_forward
    @index_stations += 1 if @index_stations != route.stations.length - 1
    route.stations[@index_stations].name
  end

  #Поезд движется на одну станцию назад
  def move_back
    @index_stations -= 1 if @index_stations != 0
    route.stations[@index_stations].name
  end

  #текущую
  def current_station
    current_station = route.stations[@index_stations]
    current_station.name

  end

  protected
  # Нет задачи увидеть эти методы в интерфейсе (не должны быть видны из вне)
  # К данным методам должен быть доступ из подклассов
  #следующую
  def next_station
    route.stations[@index_stations + 1].name if @index_stations != route.stations.length - 1
  end

  #Возвращает предыдущую станцию
  def previous_station
    route.stations[@index_stations - 1].name if @index_stations != 0
  end

  def validate!
    validate_number?
    number_size?
    correct_number?
  end

  def validate_number?
    raise "Номер поезда не указан и/или тип поезда" if number_train.nil? || type.nil?
  end

  def number_size?
    raise "Номер поезда не должен быть больше 25 символов" if number_train.size > 25
  end

  def correct_number?
    raise "Некорректный номер поезда" if number_train !~ NUMBER_TRAIN_FORMAT
  end

  def car_train(&block)
    return "Нет блока" unless block_given?
    @cars.each {|car| yield(car)}
  end

end
