require 'docking_station'

shared_examples_for "a bike container" do
  let(:container) { described_class.new }

  it "should show a docked bike" do
    bike = double(:bike)
    container.dock(bike)
    expect(container.stored_bikes).to eq [bike]
  end
end

describe DockingStation do
  it_behaves_like "a bike container"
end
