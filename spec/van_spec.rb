require 'van'

describe Van do
  let(:bike_1) { double(:bike, working?: true) }
  let(:bike_2) { double(:bike, working?: false) }
  let(:station) { double(:station) }

  it 'should take broken bikes from docking stations' do
    allow(station).to receive(:stored_bikes).and_return([bike_1, bike_2])
    subject.take_broken_bikes(station)
    expect(subject.stored_bikes).to eq [bike_2]
  end

  it 'should be able to distribute working bikes to docking stations' do
    allow(station).to receive(:stored_bikes).and_return([])
    subject.stored_bikes << bike_1
    subject.stored_bikes << bike_2
    subject.deliver_working_bikes(station)
    expect(subject.stored_bikes).to eq [bike_2]
  end
end
