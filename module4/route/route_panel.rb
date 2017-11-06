class RoutePanel
	attr_accessor :route

	def current_station(current_station_index)
		self.get_route(current_station_index)[:current_station]
	end

	def previous_station(current_station_index)
		self.get_route(current_station_index)[:previous_station]
	end

	def next_station(current_station_index)
		self.get_route(current_station_index)[:next_station]
	end

  def print_route
    stations_route = get_route
    message = ''

    if previous_station = stations_route[:previous_station]&.name
      message += "Предыдущая станция #{previous_station}. "
    end

    message += "Текущая станция #{stations_route[:current_station].name}. "

    if next_station = stations_route[:next_station]&.name
      message += "Следующая станция #{next_station}. "
    end
  end

  def get_route(current_station_index)
    route = {}
    route[:current_station] = self.route.stations[current_station_index]

    previous_station_index = current_station_index - 1
    if previous_station_index >= 0
      route[:previous_station] = self.route.stations[previous_station_index]
    end

    max_station_index = self.route.stations.count
    next_station_index = current_station_index + 1
    if next_station_index <= max_station_index
      route[:next_station] = self.route.stations[next_station_index]
    end

    route
  end 
end