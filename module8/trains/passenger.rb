class PassengerTrain < Train
  attr_reader :seats_count, :reserved_places_count

  def initalize(seats_count)
    self.seats_count = seats_count
  end

  def reserve_place
    reserved_places_count += 1
  end

  def wagons_add(wagon) 
    @wagons << wagon if wagon.to_s == 'PassengerWagon'
  end

  private

  attr_writer :reserved_places_count
end