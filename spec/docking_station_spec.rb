require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it "should return a Bike" do
    bike = double("bike", :working? => true)
    subject.dock(bike)
    expect(subject.release_bike).to be bike
  end

  it "should be working " do
    bike = double("bike", :working? => true)
    subject.dock(bike)
    expect(subject.release_bike.working?).to eq true
  end

  it "should dock a bike" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "should show a docked bike" do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.docked_bikes).to eq [bike]
  end

  it "release_bike should raise an error" do
    expect {subject.release_bike}.to raise_error("Docking station is empty")
  end

  it "dock(bike) should raise an error" do
    bike = double(:bike)
    subject.capacity.times { subject.dock(bike) }
    expect {subject.dock(bike)}.to raise_error("Docking station is full")
  end

  it "should have a default capacity of DEFAULT_CAPACITY" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "capacity can be set" do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  it "should report a broken bike" do
    bike = double("bike", :working? => false, :report_broken => false)
    bike.report_broken
    subject.dock(bike)
    expect(subject.docked_bikes[0].working?).to eq false
  end

  it "should not release a broken bike" do
    bike = double("bike", :working? => false)
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error "Bike not working!"
  end

end
