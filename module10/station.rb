require_relative './shared/validator'
require_relative './shared/acessors'
require_relative('./wagons/wagon.rb')
require_relative('./wagons/cargo.rb')
require_relative('./wagons/passenger.rb')

class Station
  include Validator
  extend Acessors

  @@instances = []

  attr_accessor_with_history :name, :wagon

  validate :name, :presence  

  def self.all
    @@instances
  end

  def self.each
    @@instances.each do |instance|
      yield instance
    end
  end

  def initialize(name)
    @name = name
    validate!

    @trains = []
    @@instances << self
  end

  def accept_train(train)
    @trains << train
  end

  def print_info
    p "На станции: #{name}"
    p "Стоит #{@trains.count} поездов"
    @trains.each do |train, index|
      p "#{index} №#{train.number} - #{train.type}"
      p 'Вагоны:'
      train.wagons.each { |wagon, index| p wagon.print_info(index) }
    end
  end

  def send_train(train)
    @trains.delete(train)
  end

  def each_train
    @trains.each do |train|
      yield train
    end
  end

  def trains(type = nil)
    if !type.nil?
      @trains.select { |train| train.type == type }
    else
      @trains
    end
  end

end