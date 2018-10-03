require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it "should return a Bike" do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it "should be working " do
    subject.dock(Bike.new)
    expect(subject.release_bike.working?).to eq true
  end

  it "should dock a bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "should show a docked bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.docked_bikes).to eq [bike]
  end

  it "release_bike should raise an error" do
    expect {subject.release_bike}.to raise_error("Docking station is empty")
  end

  it "dock(bike) should raise an error" do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
    expect {subject.dock(Bike.new)}.to raise_error("Docking station is full")
  end

end
