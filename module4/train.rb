require('pry')
TYPES = ['Грузовой', 'Пассажирский']

class Train
  attr_reader :wagons, :route, :current_station_index, :station, :number, :type
  attr_accessor :speed

  def initialize(number, type, wagons)
    self.speed = 0
    @number = number
    @type = type
    @wagons = wagons
  end

  def speed_raise(num)
    self.speed += num
  end

  def stop
    self.speed = 0
  end

  def wagons_add
    @wagons += 1 if @speed == 0
  end

  def wagons_remove
    @wagons += 1 if @wagons > 0 and @speed == 0
  end

  def route=(route)
    @route = route
    @current_station_index = 0
    self.current_station.accept_train(self)
  end

  def move_back
    return if @current_station_index == 0
    self.current_station.send_train(self)
    @current_station_index -= 1
    self.current_station.accept_train(self)
  end

  def move_forward
    return if @current_station_index == @route.stations.length - 1
    self.current_station.send_train(self)
    @current_station_index -= 1
    self.current_station.accept_train(self)
  end

  def next_station
    return if @current_station_index == @route.stations.length - 1

    @route.stations[@current_station_index + 1]
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    return if @current_station_index == 0
    @route.stations[@current_station_index - 1]
  end

end