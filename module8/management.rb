class Management
  attr_reader :stations, :routes, :trains

  TRAIN_TYPES = { 1 => CargoTrain, 2 => PassengerTrain }

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def run
    main_menu if choice == 0 or choice.nil?
    choice = gets.chomp.to_i

    case choice
    when 1 then create_station
    when 2 then create_train
    when 3 then create_route_starting
    when 4 then set_route_to_train
    when 5, 6 then wagons_control
    when 7 then move_train
    when 8 then 
      stations
    end
  end

  private
  
  attr_accessor :choice

  def move_train
    train = select_train

    p "1. Переместить вперед"
    p "2. Переместить назад"
    choice = gets.chomp.to_i

    if choice == 1
      train.move_forward
    else
      train.move_back
    end

    run
  end

  def select_train
    p "Выберите поезд из списка"
    list_of_trains
    train_number = gets.chomp.to_i

    train = @trains[train_number]
  end

  def select_route
    p "Выберите маршрут из списка"
    list_of_routes

    route_index = gets.chomp

    @routes[route_index]
  end  

  def set_route_to_train
    train = select_train
    route = select_route

    train.route=route

    run
  end

  def wagons_control
    p "Введите номер поезда для управления вагонами"
    train_number = gets.chomp

    train = train_by_number(train_number)
    p "Вы выбрали поезд #{ train.number }"

    p "1. Добавить вагон"
    p "2. Удалить вагон"
    choice = gets.chomp.to_i

    if choice == 1
      wagon_add(train)
    else
      wagon_remove(train)
    end

    run
  end

  def wagon_add(train)
    train.wagons_add(train)
  end

  def wagon_remove(train)
    train.wagons_remove
  end

  def train_by_number (number)
    @trains.find { |train| train.number == number }
  end

  def list_of_stations
    @stations.each_with_index do |station, index|
      p "#{index}. Станция #{ station.name }"
      p "Поезда на станции #{ trains_by_station(station) }" if !station.trains.length.zero?
    end
  end

  def list_of_trains
    @trains.each_with_index do |train, index|
      p "#{ index }. Поезд номер #{ train.number }"
    end
  end

  def create_route_starting
    if @stations.length < 2
      p 'У вас недостаточно созданных станций для основных функций управления маршрутами'
      
      run
    end

    p "Управление маршрутами"
    p "1. Создать"
    p "2. Список"
    p "0. Вернуться в основное меню"

    choice = gets.chomp
    create_route if choice.length.zero?

    case choice
    when '1'
      create_route
    when '2'
      p 'Список маршрутов'
      list_of_routes
    end
  end

  def create_route
    p "Выберите первую станцию из списка"
    list_of_stations
    first_station_index = gets.chomp.to_i
    first_station = @stations[first_station_index]

    p "Выберите вторую станцию из списка"
    list_of_stations
    second_station_index = gets.chomp.to_i
    second_station = @stations[second_station_index]

    p "Выберите название для маршрута"
    route_name = gets.chomp

    new_route = Route.new(route_name, first_station, second_station)
    @routes << new_route
    p "Маршрут #{ new_route.name } создан."

    run
  end

  def create_train
    p "Введите тип поезда"
    p "1. Грузовой"
    p "2. Пассажирский"
    train_type = gets.chomp.to_i
    raise 'Ошибка выбора типа поезда' if !TRAIN_TYPES.keys.include?(train_type) or train_type.zero?

    p "Введите номер поезда" 

    train_number = gets.chomp
    create_train if train_number.length.zero?

    train = TRAIN_TYPES[train_type].new(train_number)
    @trains << train
    p "Поезд создан #{train.number}"
    p "--------------------------------"

    run
  rescue => e
    p e.message
    retry
  end

  def create_station
    p "Введите название станции"
    station_name = gets.chomp
    create_station if station_name.length.zero?

    station = Station.new(station_name)
    @stations << station
    p "Станция создана #{station.name}"
    p "--------------------------------"

    run
  end

  def main_menu
    p ' '
    p "1. Создать станцию"
    p "2. Создать поезд"
    p "3. Создавать маршруты и управлять станциями в нем (добавлять, удалять)"
    p "4. Назначать маршрут поезду"
    p "5. Добавлять вагоны к поезду"
    p "6. Отцеплять вагоны от поезда"
    p "7. Перемещать поезд по маршруту вперед и назад"
    p '8. Просматривать список станций и список поездов на станции'
    p '0. Закрыть'
  end

  def reset_choice
    choice = 0
  end

  def trains_by_station (station)
    station.trains.collect { |train| '№ ' + train.number.to_s }.join(', ')
  end

  def list_of_routes
    @routes.each_with_index do |route, index|
      p "#{ index }. Маршрут номер #{ route.name }"
    end
  end
end