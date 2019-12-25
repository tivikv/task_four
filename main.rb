require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'car'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_car'
require_relative 'cargo_car'

stations = []
trains = []

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

loop do
  print "Введите номер команды: "
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Введите название станции"
    name = gets.chomp
    stations << Station.new(name)
    puts "Создана станция #{name}"
    puts "Все станции: #{stations}"

  when 2
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
      puts "Все поезда: #{trains}"
    end

  when 3
    puts "Введите начальную и конечную станцию"
    start_station = gets.chomp
    end_station = gets.chomp
    routes = Route.new(start_station, end_station)
    puts "Введите станцию, которую хотите добавить в маршрут"
    station = gets.chomp
    routes.add_station(station)
    puts "Станция #{station} добавлена в маршрут"
    puts "Введите станцию, которую хотите удалить"
    station = gets.chomp
    routes.delete_station(station)
    puts "Станция #{station} удалена из маршрута"


  when 4
   puts "Выберите поезд для назначения маршрута"
   number_train = gets.chomp.to_i
   train = trains.find(number_train)
   train.train_route=(route)
   puts "Поезду #{number_train} назначен маршрут #{route}"


 when 5
  puts "К какому поезду прицепить вагон"
  number_train = gets.chomp
  train = trains.find(number_train)
  train.add_car
  puts "Прицеплен вагон"

when 6
  puts "От какого поезда отцепить вагон"
  number_train = gets.chomp.to_i
  train = trains.find(number_train)
  train.delete_car
  puts "Отцеплен вагон"

when 7
  puts "Поезд, который необходимо поместить на станцию"
  number_train = gets.chomp.to_i
  train = trains.detect{|train| train.number_train == number_train}
  if train.nil?
    puts "Такого поезда нет"
  else
    puts "Станция назначения"
    name = gets.chomp
    station = stations.detect{|station| station.name == name}
    if station.nil?
      puts "Такой станции нет"
    else
      station.take_train(train)
    end
  end

when 8
  puts "Станция, на которй необходимо посмотреть список поездов"
  name = gets.chomp
  station = stations.detect{|station| station.name == name}
  if station.nil?
    puts "Выбранной станции нет"
  else
    station.trains
  end

when 0
  break

end


end
