require_relative('./route.rb')
require_relative('./station.rb')
require_relative('./train.rb')

moskva_station = Station.new('Москва')
piter_station = Station.new('Санкт-Петербург')
perm_station = Station.new('Пермь')

siberia_route = Route.new([moskva_station, piter_station])
siberia_route.station_add(perm_station)

siberia_route.station_remove(perm_station)

p 'Станции маршрута:' 
p "#{siberia_route.stations.collect { |station| station.name }.join(', ')}"
p '-----------------------'

cargo_train = Train.new(1, TYPES[0], 4)
passengers_train = Train.new(2, TYPES[1], 10)

cargo_train.route = siberia_route
passengers_train.route = siberia_route

p "На станции #{moskva_station.name}, стоят следующие поезда:" 
p "#{moskva_station.trains.collect { |train| '№ ' + train.number.to_s }.join(', ') }"
p '------------------'

cargo_train.move_forward

# p cargo_train.current_station
# p cargo_train.print_route