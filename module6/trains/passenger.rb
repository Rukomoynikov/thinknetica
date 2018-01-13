class PassengerTrain < Train
  def wagons_add(wagon) 
    @wagons << wagon if wagon.to_s == 'PassengerWagon'
  end
end