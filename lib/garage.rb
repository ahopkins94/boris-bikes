require_relative 'bike'
require_relative 'van'

class Garage
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def take_bikes(van)
    van.stored_bikes.each do |bike|
      @stored_bikes << bike
      van.stored_bikes.delete(bike)
    end
  end

  def fix_bikes
    @stored_bikes.each { |bike| bike.fix }
  end
end
