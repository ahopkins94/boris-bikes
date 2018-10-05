require 'garage'
require 'pry'
describe Garage do
  let(:bike) { double(:bike, working?: false) }
  let(:bike_2) { double(:bike, working?: true) }
  let(:van) { double(:van) }

  it 'should receive broken bikes to be fixed' do
    allow(van).to receive(:stored_bikes).and_return([bike])
    subject.take_bikes(van)
    expect(subject.stored_bikes).to eq [bike]
  end

  it 'should be able to fix broken bikes' do
    subject.stored_bikes << bike
    expect(bike).to receive(:fix)
    subject.fix_bikes
  end

  it 'should release fixed bikes to a van' do
    allow(van).to receive(:stored_bikes).and_return([])
    subject.stored_bikes << bike
    subject.stored_bikes << bike_2
    subject.release_fixed_bikes(van)
    expect(subject.stored_bikes).to eq [bike]
  end
end
