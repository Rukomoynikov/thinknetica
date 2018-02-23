class PassengerWagon < Wagon
  attr_reader :seats_count, :reserved_places_count

  def initialize(seats_count)
    self.seats_count = seats_count
  end

  def reserve_place
    self.reserved_places_count ||= 0
    self.reserved_places_count += 1
  end

  def reserve_all_place
    reserved_places_count = seats_count
  end

  def available_places_count
    seats_count - reserved_places_count
  end

  def print_info(index)
    "№#{index} Пассажирский вагон,
    свободно #{available_places_count} мест,
    занято #{reserved_places_count} мест."
  end

  private

  attr_writer :seats_count, :reserved_places_count
end
