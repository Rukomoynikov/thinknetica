require_relative './shared/validator'
require 'pry'

class Station
  include Validator

  @@instances = []

  attr_reader :name

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
    p "На станции: #{ self.name }"
    p "Стоит #{ @trains.count } поездов"
    @trains.each do |train, index| 
      p "#{index} №#{train.number} - #{ train.type }"
      p "Вагоны:"
      train.wagons.each { |wagon, index| p wagon.print_info(index) }
    end
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains(type = nil)
    if !type.nil?
      @trains.select { |train| train.type == type }
    else
      @trains
    end
  end

  private 

  def validate!
    raise 'Пустое название' if self.name.nil? or self.name.length.zero?
  end
end