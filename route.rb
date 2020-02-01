class Route
  include InstanceCounter
  attr_reader :start_station, :end_station, :stations

  NAME_FORMAT = /^[а-яА-ЯёЁa-zA-Z0-9]+$/

  def initialize (start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
    instances_quantity
    validate!
  end

  def validate?
    validate!
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
    raise "Не указана начальная и/или конечная станция" if start_station || end_station.nil?
    raise "Начальная станция должная быть отличной от конечной станции" if @stations[index_start_station-1] == @stations[index_end_station]
    raise "Некорректное название станции" if start_station !~ NAME_FORMAT && end_station !~ NAME_FORMAT
  end

end
