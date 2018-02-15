require_relative './shared/validator'

class Route
  include Validator

  attr_reader :stations, :name

  def initialize(name, first_station, last_station)
    @stations = [first_station, last_station]
    @name = name

    validate!
  end

  def station_add(station)
    @stations.insert(-2, station)
  end

  def station_remove(station)
    @stations.delete(station)
  end

  private 

  def validate!
    raise 'Пустое название' if self.name.nil? or self.name.length.zero?
    raise 'Объект не является Станцией' if stations[0].class != Station or stations[1].class != Station
    raise 'Конечная и начальная станции не могут быть одинаковыми' if stations[0] == stations[1]
  end
end