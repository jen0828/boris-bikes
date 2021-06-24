
require 'docking_station'
require 'bike'

describe DockingStation do
  let(:bike) { double(:bike) }

  it { is_expected.to respond_to :release_bike }

  it 'releases a bike if working' do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes availale' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'does not release broken bikes' do
      allow(bike).to receive_message_chain(:report_broken, :working) { false }
      bike.report_broken
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return(false)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end

    describe '#dock' do
      it 'raises an error when full' do
        subject.capacity.times { subject.dock double :bike }
        expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
      end

      it 'accepts broken bikes' do
        allow(bike).to receive_message_chain(:report_broken, :working) { false }
        bike.report_broken
        expect(subject.dock(bike)).to eq [bike]
      end

      it 'accepts broken bikes' do
        allow(bike).to receive_message_chain(:report_broken, :working) { false }
        bike.report_broken
        expect(subject.dock(bike)).to eq [bike]
      end
    end
  end
end
