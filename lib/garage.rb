require_relative 'bike'
require_relative 'van'

class Garage
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def take_broken_bikes(van)
    van.stored_bikes.each do |bike|
      if bike.working? == false
        @stored_bikes << bike
        van.stored_bikes.delete(bike)
      end
    end
  end

  def fix_bikes
    @stored_bikes.each(&:fix)
  end

  def release_fixed_bikes(van)
    @stored_bikes.each do |bike|
      if bike.working?
        van.stored_bikes << bike
        @stored_bikes.delete(bike)
      end
    end
  end
end
