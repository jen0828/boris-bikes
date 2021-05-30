require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bike

  def initialize
    @bikes = []
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike #docking a bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bike.pop
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end