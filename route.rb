class Route
  require_relative 'modules.rb'
  include InstanceCounter
  attr_reader :start_station, :end_station, :stations

  NAME_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]+$/

  def initialize (start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
    validate!
    instances_quantity
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  #Добавляет промежуточную станцию
  def add_station (station)
    @stations.insert(1, station)
  end

  #Удаляет промежуточную станцию
  def delete_station(station)
    @stations.delete(station)
  end

  protected
  def validate!
    statoin_nil?
    station_station?
    correct_name?
  end

  def statoin_nil?
    raise "Не указана начальная и/или конечная станция" if start_station || end_station.nil?
  end

  def station_station?
    raise "Начальная станция должная быть отличной от конечной станции" if @stations[index_start_station-1] == @stations[index_end_station]
  end

  def correct_name?
    raise "Некорректное название станции" if start_station !~ NAME_FORMAT && end_station !~ NAME_FORMAT
  end

end
