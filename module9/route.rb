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
    raise 'Пустое название' if name.nil? || name.length.zero?
    raise 'Объект не является Станцией' unless classes_valid?(stations, Station)

    raise 'Конечная и начальная станции не могут быть одинаковыми' if stations_duplcate?(stations)
  end

  def classes_valid?(stations, station_class)
    stations.all? { |station| station.class == station_class }
  end

  def stations_duplcate?(stations)
    initial_length = stations.length
    stations.uniq.length != initial_length
  end
end
