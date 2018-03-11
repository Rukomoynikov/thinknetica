require_relative '../shared/manufacturer'
require_relative '../shared/instance_counter'
require_relative '../shared/validator'

class Train
  NUMBER_FORMAT = /^[\w|\d]{3}-?[a-z,а-я]{2}$/
  include Validator
  include Manufacturer
  include InstanceCounter

  @@instances = {}

  attr_reader :route, :current_station_index, :station, :number, :wagons, :speed

  def initialize(number)
    self.speed = 0
    @number = number
    validate!

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

  def each_wagon
    wagons.each { |wagon| yield wagon }
  end

  def speed_raise(num)
    self.speed += num
  end

  def stop
    self.speed = 0
  end

  def wagons_remove
    @wagons.pop if (@wagons > 0) && @speed.zero?
  end

  def route=(route)
    @route = route
    @current_station_index = 0

    current_station.accept_train(self)
  end

  def move_back
    return if @current_station_index.zero?
    current_station.send_train(self)
    @current_station_index -= 1

    current_station.accept_train(self)
  end

  def move_forward
    return if @current_station_index == @route.stations.length - 1
    current_station.send_train(self)
    @current_station_index -= 1
    current_station.accept_train(self)
  end

  def next_station
    return if @current_station_index == @route.stations.length - 1

    @route.stations[@current_station_index + 1]
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    return if @current_station_index.zero?
    @route.stations[@current_station_index - 1]
  end

  private

  attr_writer :speed

  def validate!
    raise 'Пустой номер' if number.nil? || number.length.zero?
    raise 'Некорректный номер поезда' unless correct_number?
  end

  def correct_number?
    NUMBER_FORMAT.match(number).nil? ? false : true
  end
end
