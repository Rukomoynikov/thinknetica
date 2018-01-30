class PassengerTrain < Train
  def type
    'пассажирский'
  end

  def wagons_add(wagon) 
    @wagons << wagon if wagon.class.to_s == 'PassengerWagon'
  end
end