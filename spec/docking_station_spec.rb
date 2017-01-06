require 'docking_station'

describe DockingStation do 

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    subject.release_bike
    expect(bike).to be_working
  end

  it 'will not release bikes when empty' do
    expect {subject.release_bike}.to raise_error "No bikes available"
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it 'remembers docked bike' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes[-1]).to eq bike
  end

  it 'will not dock bikes when full' do
    subject.capacity.times {subject.dock_bike(Bike.new)}
    expect {subject.dock_bike(Bike.new)}.to raise_error "Docking station full"
  end

  
end