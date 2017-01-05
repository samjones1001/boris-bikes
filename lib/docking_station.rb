require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail 'Docking Station is full' if @bikes.count >= 20
    @bikes << bike
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    bike = @bikes.pop
  end

  def bike
    @bike
  end

end
