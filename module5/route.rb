class Route
  attr_reader :stations, :name

  def initialize(name, first_station, last_station)
    @stations = [first_station, last_station]
    @name = name
  end

  def station_add(station)
    @stations.insert(-2, station)
  end

  def station_remove(station)
    @stations.delete(station)
  end

end