require_relative '../shared/manufacturer'
require_relative '../shared/instance_counter'
require 'byebug'

class Train
  include Manufacturer
  include InstanceCounter

  @@instances = {}

  attr_reader :route, :current_station_index, :station, :number, :wagons, :speed

  def initialize(number)
    self.speed = 0
    @number = number
    @wagons = []
    @@instances[number] = self
    register_instance
  end

  class << self
    def all
      @@instances
    end

    def find(number)
      @@instances[number]
    end
  end

  def speed_raise(num)
    self.speed += num
  end

  def stop
    self.speed = 0
  end

  def wagons_remove
    @wagons.pop if @wagons > 0 and @speed == 0
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

  private 

  attr_writer :speed

end