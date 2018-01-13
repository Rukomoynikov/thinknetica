class Station
  @@instances = []

  attr_reader :name

  def self.all
    @@instances    
  end

  def initialize(name)
    @name = name
    @trains = []
    @@instances << self
  end

  def accept_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains(type = nil)
    if !type.nil?
      @trains.select { |train| train.type == type }
    else
      @trains
    end
  end

end
