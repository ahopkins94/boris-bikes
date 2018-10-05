require "docking_station"
describe Bike do
  it { is_expected.to respond_to :working? }

  describe "#fix" do
    it "should fix a broken bike" do
     subject.report_broken
     subject.fix
     expect(subject.working?).to eq true
    end
  end

end
