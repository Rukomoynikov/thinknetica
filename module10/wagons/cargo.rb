class CargoWagon < Wagon
  attr_reader :cargo_space, :reserved_cargo_space

  def initialize(cargo_space)
    self.cargo_space = cargo_space
  end

  def reserve_space(space)
    self.reserved_cargo_space ||= 0

    self.reserved_cargo_space = space if fit?(space)
  end

  def reserve_space_all
    self.reserved_cargo_space = cargo_space
  end

  def available_space
    cargo_space - reserved_cargo_space
  end

  def print_info(index)
    "№#{index} Грузовой вагон,
    свободно #{available_space} для загрузки,
    занято #{reserved_cargo_space}."
  end

  private

  attr_writer :cargo_space, :reserved_cargo_space

  def fit?(space)
    self.reserved_cargo_space + space <= cargo_space
  end
end
