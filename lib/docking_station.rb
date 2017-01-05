require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail 'Docking Station is full' if full? #@bikes.count >= 20
    @bikes << bike

  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def bike
    @bike
  end

  private

  def full?
    @bikes.size >= 20
  end

  def empty?
    @bikes.size == 0
  end
end
