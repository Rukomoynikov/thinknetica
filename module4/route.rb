require('pry')

class Route
  attr_reader :stations

  def initialize(stations)
    @stations = stations
  end

  def station_add(station)
    @stations.insert(-2, station)
  end

  def station_remove(station)
    @stations.delete(station)
  end

end