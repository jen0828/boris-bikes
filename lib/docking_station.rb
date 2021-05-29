require_relative 'bike'

class DockingStation
  attr_reader :bike

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station is full' if @bikes.count >= 20
    @bikes << bike
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bike.pop
  end

  private

  def full?
    @bikes.count >= 20
  end

  def empty?
    @bikes.empty?
  end
end