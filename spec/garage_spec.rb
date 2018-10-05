require 'garage'

describe Garage do
  let(:bike) { double(:bike, working?: false) }
  let(:van) { double(:van) }

  it 'should receive broken bikes to be fixed' do
    allow(van).to receive(:stored_bikes).and_return([bike])
    subject.take_bikes(van)
    expect(subject.stored_bikes).to eq [bike]
  end
end
