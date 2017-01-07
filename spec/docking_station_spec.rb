require 'docking_station'

describe DockingStation do 

	it 'can set a maximum capacity' do
		station = DockingStation.new(5)
		expect(station.capacity).to eq 5
	end

	it 'has a default capacity' do
		station = DockingStation.new
		expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it "releases a bike" do
		bike = Bike.new
		subject.dock_bike(bike)
		expect(subject.release_bike).to eq bike
	end

	it 'releases working bikes' do
		subject.dock_bike(Bike.new)
		bike = subject.release_bike
		expect(bike).to be_working
	end

	it 'docks bikes' do
		bike = Bike.new
		expect(subject.dock_bike(bike)).to eq [bike]
	end

	it {is_expected.to respond_to :bikes}

	it 'remembers docked bikes' do
		bike = Bike.new
		subject.dock_bike(bike)
		expect(subject.bikes).to eq [bike]
	end

	it 'raises an error when station is empty' do
		expect{subject.release_bike}.to raise_error("Docking station empty!")
	end

	it 'raises an error when station is full' do
		subject.capacity.times{subject.dock_bike(Bike.new)}
		expect{subject.dock_bike(Bike.new)}.to raise_error("Docking station full!")
	end

	it 'raises as error when bike is broken' do
		bike = Bike.new
		bike.report_broken
		subject.dock_bike(bike)
		expect{subject.release_bike}.to raise_error("Bike is broken")
	end


end