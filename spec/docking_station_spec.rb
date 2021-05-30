require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }
 
  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

    describe '#release_bike' do
      it 'raises an error when there are no bikes availale' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end

    describe '#dock' do
      it 'raises an error when full' do
        DockingStation::DEFAULT_CAPACITY.times do 
          subject.dock Bike.new
        end
        expect { subject.dock Bike.new}.to raise_error 'Docking station is full'
      end
    end
  end 
end
