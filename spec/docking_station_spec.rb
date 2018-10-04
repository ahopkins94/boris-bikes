require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it "should return a Bike" do
    # here
    subject.dock(double(:bike))
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it "should be working " do
    # here
    subject.dock(double(:bike))
    expect(subject.release_bike.working?).to eq true
  end

  it "should dock a bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "should show a docked bike" do
    # here
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.docked_bikes).to eq [bike]
  end

  it "release_bike should raise an error" do
    expect {subject.release_bike}.to raise_error("Docking station is empty")
  end

  it "dock(bike) should raise an error" do
    # here
    subject.capacity.times { subject.dock(double(:bike)) }
    expect {subject.dock(double(:bike))}.to raise_error("Docking station is full")
  end

  it "should have a default capacity of DEFAULT_CAPACITY" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "capacity can be set" do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  it "should report a broken bike" do
    # here
    bike = double(:bike)
    bike.report_broken
    subject.dock(bike)
    expect(subject.docked_bikes[0].working?).to eq false
  end

  it "should release a working bike not a broken bike" do
    # here
    working_bike = double(:bike)
    subject.dock(working_bike)
    broken_bike = double(:bike)
    broken_bike.report_broken
    subject.dock(broken_bike)
    expect(subject.release_bike.working?).to eq true
  end

end
