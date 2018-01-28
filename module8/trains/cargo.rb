class CargoTrain < Train
  attr_reader :cargo_space, :reserved_cargo_space

  def initialize(cargo_space)
    self.cargo_space = cargo_space
  end

  def reserve_space(space)
    self
  end

  def wagons_add(wagon) 
    @wagons << wagon if wagon.to_s == 'CargoWagon'
  end

  private

  attr_writer :reserved_cargo_space
end