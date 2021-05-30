require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

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
        expect{ subject.dock(bike) }.to raise_error 'Docking station full'
      end
    end
    
    describe '#release_bike' do
      it 'raises an error when there are no bikes availale' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end

    describe '#dock' do
      it 'raises an error when full' do
        subject.capacity.times { subject.dock Bike.new } 
        expect { subject.dock Bike.new}.to raise_error 'Docking station full'
      end
    end
  end 
end
