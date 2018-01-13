require_relative('./route.rb')
require_relative('./station.rb')
require_relative('./trains/train.rb')
require_relative('./trains/cargo.rb')
require_relative('./trains/passenger.rb')
require_relative('./wagons/wagon.rb')
require_relative('./wagons/cargo.rb')
require_relative('./wagons/passenger.rb')
require_relative('./management')

management = Management.new
management.run