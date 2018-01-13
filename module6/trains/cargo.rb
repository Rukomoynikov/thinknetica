require 'pry'

class CargoTrain < Train
  def wagons_add(wagon) 
    @wagons << wagon if wagon.to_s == 'CargoWagon'
  end
end