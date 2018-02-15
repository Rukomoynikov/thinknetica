class CargoTrain < Train
  def type
    'грузовой'
  end

  def wagons_add(wagon) 
    @wagons << wagon if wagon.class.to_s == 'CargoWagon'
  end
end