require 'docking_station'

class Van
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def take_broken_bikes(station)
    station.docked_bikes.each do |bike|
      if bike.working? == false
        @stored_bikes << bike
        station.docked_bikes.delete(bike)
      end
    end
  end
end


# [bike_1, bike_2].working?
