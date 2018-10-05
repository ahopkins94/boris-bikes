require_relative 'bike'
require_relative 'van'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :stored_bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @stored_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Docking station is empty" if empty?
    raise "Bike not working!" unless @stored_bikes.last.working?
    @stored_bikes.pop
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @stored_bikes << bike
  end

  private

  def full?
    return true if @stored_bikes.length == capacity
  end

  def empty?
    return true if @stored_bikes.empty?
  end

end
