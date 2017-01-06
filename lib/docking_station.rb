require_relative 'bike'

class DockingStation
DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize (capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking Station is full' if full? #@bikes.count >= 20
    bikes << bike

  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end

  def bike
    bike
  end

  private

  attr_reader :bike 

  def full?
    bikes.size >= @capacity
  end

  def empty?
    bikes.size == 0
  end
end
