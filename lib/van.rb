require_relative 'docking_station'
require_relative 'bike'

class Van
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def take_broken_bikes(station)
    station.stored_bikes.each do |bike|
      if bike.working? == false
        @stored_bikes << bike
        station.stored_bikes.delete(bike)
      end
    end
  end

  def deliver_working_bikes(station)
    @stored_bikes.each do |bike|
      if bike.working?
        station.stored_bikes << bike
        @stored_bikes.delete(bike)
      end
    end
  end
end
