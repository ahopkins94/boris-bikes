require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :docked_bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Docking station is empty" if empty?
    @docked_bikes.reverse.each do |bike|
      if bike.working?
        @docked_bikes.slice!(@docked_bikes.index(bike))
        return bike
      end
    end
  end

  def dock(bike)
    raise "Docking station is full" if full?

    @docked_bikes << bike
  end

  private

  def full?
    return true if @docked_bikes.length == capacity
  end

  def empty?
    return true if @docked_bikes.empty?
  end

end
