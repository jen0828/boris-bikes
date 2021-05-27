require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  # it 'release working bikes' do
  #   bike = subject.release_bike
  #   expect(bike).to be_working
  # end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  # it 'docks something' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq bike
  
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
  end

    describe '#release_bike' do
      it 'raises an error when there are no bikes availale' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end
end