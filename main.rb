require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'car'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_car'
require_relative 'cargo_car'

class RailWay

  attr_accessor :trains, :cars, :stations, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @cars = []
    route = nil
  end

  def choice
#puts "Введите команду:"
puts "1, если необходимо Cоздать станцию"
puts "2, если необходимо Cоздать поезд"
puts "3, если необходимо Создать маршрут, Добавить станцию в маршрут,Удалить станцию из маршрута"
puts "4, если необходимо Назначить маршрут поезду"
puts "5, если необходимо Добавить вагоны к поезду"
puts "6, если необходимо Отцепить вагоны от поезда"
puts "7, если необходимо Перемещать поезд на 1 станцию"
puts "8, если необходимо Просмотреть список станций и список поездов на станции"
puts "0, для Выхода из программы"
end

def action
  loop do
    print "Введите номер команды: "
    choice

    case gets.chomp.to_i

    when 0
      puts 'До новых встреч!'
      break
    when 1
      create_station
    when 2
      create_train
    when 3
      create_route
    when 4
      assign_route
    when 5
      add_car
    when 6
      delete_car
    when 7
      move_train
    when 8
      list_trains
    end
  end
end

def create_station
  puts "Введите название станции"
  name = gets.chomp
  self.stations << Station.new(name)
  puts "Создана станция #{name}"
  puts "Все станции: #{stations}"
end

def create_train
  puts "Введите номер поезда"
  number_train = gets.chomp.to_i
  puts "Введите тип поезда: 1 - 'passenger' или 2 -'cargo'"
  type = gets.chomp.to_i
  if type == 1
    trains << PassengerTrain.new(number_train, type)
    puts "Пассажирский поезд #{number_train}"
  elsif type == 2
    trains << CargoTrain.new(number_train, type)
    puts "Грузовой поезд #{number_train}"
  end
  puts "Все поезда: #{trains}"
end

def create_route
  puts "Введите начальную и конечную станцию"
  start_station = gets.chomp
  end_station = gets.chomp
  route = Route.new(start_station, end_station)
  routes << route
  puts "Введите станцию, которую хотите добавить в маршрут"
  station = gets.chomp
  route.add_station(station)
  puts "Станция #{station} добавлена в маршрут"
  puts "Введите станцию, которую хотите удалить"
  station = gets.chomp
  route.delete_station(station)
  puts "Станция #{station} удалена из маршрута"
  puts "Маршрут: #{route.stations}"
end

def assign_route
  puts "Все поезда: #{trains}"
  puts "Маршрут: #{routes}"
  puts "Выберите поезд для назначения маршрута"
  number_train = gets.chomp.to_i
  train = trains.find {|train| @number_train = number_train}
  puts "#{train}"
  puts "Маршрут: #{routes}"
  train.route = routes
  puts "Поезду #{number_train} назначен маршрут #{routes}"
end

def add_car
  puts "К какому поезду прицепить вагон"
  number_train = gets.chomp
  train = trains.find(number_train)
  train.add_car
  puts "Прицеплен вагон"
end

def delete_car
  puts "От какого поезда отцепить вагон"
  number_train = gets.chomp.to_i
  train = trains.find(number_train)
  train.delete_car
  puts "Отцеплен вагон"
end

def move_train
  puts 'Выбираем поезд'
  number_train = gets.chomp
  train = trains.find {|train| @number_train = number_train}
  if train.route.nil?
    puts 'Необходимо назначить маршрут!'
  else
    puts 'Направляем поезд вперед (1) или назад(2)?'
    action = gets.chomp.to_i
    case action
    when 1
      train.move_forward
    when 2
      train.move_back
    end
  end
end


def list_trains
  puts "Станция, на которй необходимо посмотреть список поездов"
  name = gets.chomp
  station = stations.detect{|station| station.name == name}
  if station.nil?
    puts "Выбранной станции нет"
  else
    station.trains
  end
end



end

railway = RailWay.new
railway.action
