class Route

  attr_reader :start_station, :end_station, :stations

  def initialize (start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
  end

  #Добавляет промежуточную станцию
  def add_station (station)
    @stations.insert(1, station)
  end

  #Удаляет промежуточную станцию
  def delete_station(station)
    @stations.delete(station)
  end

end
