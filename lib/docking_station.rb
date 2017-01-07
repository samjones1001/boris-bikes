require_relative 'bike'

class DockingStation
	attr_reader :bikes, :capacity
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		raise "Docking station empty!" if empty?
		raise "Bike is broken" if @bikes[-1].broken?
		@bikes.pop
	end

	def dock_bike(bike)
		raise "Docking station full!" if full?
		return @bikes.unshift(bike) if bike.broken?
		@bikes << bike if !bike.broken?
	end

	
	private

	
	def full?
		@bikes.count >= capacity
	end

	def empty?
		@bikes.empty?
	end

end