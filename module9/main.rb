require_relative('./route.rb')
require_relative('./station.rb')
require_relative('./trains/train.rb')
require_relative('./trains/cargo.rb')
require_relative('./trains/passenger.rb')
require_relative('./wagons/wagon.rb')
require_relative('./wagons/cargo.rb')
require_relative('./wagons/passenger.rb')
require_relative('./management')

# management = Management.new
# management.run

# Создание станций
st1 = Station.new('Москва-3')
st2 = Station.new('Мытищи')

# Создание маршрута
route = Route.new('Siberia', st1, st2)

# Создание поездов
passenger_train = PassengerTrain.new('aaa-aa')
cargo_train = CargoTrain.new('bbb-aa')

passenger_train.route = route
cargo_train.route = route

# Создание вагонов
passenger_wagon = PassengerWagon. new(43)
passenger_wagon.reserve_place
passenger_wagon.reserve_all_place

cargo_wagon = CargoWagon.new(43)
cargo_wagon.reserve_space(13)

passenger_train.wagons_add(passenger_wagon)
cargo_train.wagons_add(cargo_wagon)

# Используя созданные в рамках задания методы, написать код, 
# который перебирает последовательно все станции и для каждой 
# станции выводит список поездов в формате:
# - Номер поезда, тип, кол-во вагонов

Station.each do |station|
  station.print_info
  p '    '
end