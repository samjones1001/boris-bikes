require 'docking_station'

describe DockingStation do 

	let(:bike) {double(:bike)}

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
		allow(bike).to receive(:working?).and_return(true)
		allow(bike).to receive(:broken?).and_return(false)
		subject.dock_bike(bike)
		released_bike = subject.release_bike
		expect(released_bike).to be_working
	end

	it 'docks bikes' do
		allow(bike).to receive(:broken?).and_return(false)
		expect(subject.dock_bike(bike)).to eq [bike]
	end

	it {is_expected.to respond_to :bikes}

	it 'remembers docked bikes' do
		allow(bike).to receive(:broken?).and_return(false)
		subject.dock_bike(bike)
		expect(subject.bikes).to eq [bike]
	end

	it 'raises an error when station is empty' do
		expect{subject.release_bike}.to raise_error("Docking station empty!")
	end

	it 'raises an error when station is full' do
		allow(bike).to receive(:broken?).and_return(false)
		subject.capacity.times{subject.dock_bike(bike)}
		expect{subject.dock_bike(bike)}.to raise_error("Docking station full!")
	end

	it 'raises as error when bike is broken' do
		allow(bike).to receive(:report_broken).and_return(true)
		allow(bike).to receive(:broken?).and_return(true)
		bike.report_broken
		subject.dock_bike(bike)
		expect{subject.release_bike}.to raise_error("Bike is broken")
	end


end