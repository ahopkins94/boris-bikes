Boris Bikes
==============

Ruby back-end business logic for a boris bikes system. Testing in Rspec.
Docking station starts off empty until a bike object is created and docked. A bike can be returned working (automatically) or reported broken. If reported broken, said bike can be put on a van and sent to a garage to be fixed and then returned in the van and docked again.

## Installation

1) Clone the repository
2) Run `bundle install` to install local dependencies
3) Run `rspec` to run the tests

## Deployment

$ irb   
$ require './lib/bike.rb'  
$ require './lib/docking_station.rb'  
$ require './lib/garage.rb'  
$ require './lib/van.rb'  
$ bike1 = Bike.new  
$ bike2 = Bike.new  
$ docking_station = DockingStation.new  
$ docking_station.dock(bike1)  
$ docking_station.dock(bike2)  
$ bike1.report_broken  
$ van = Van.new  
$ van.take_broken_bikes(docking_station)  
$ garage = Garage.new  
$ garage.take_broken_bikes(van)  
$ garage.fix_bikes  
$ garage.release_fixed_bikes(van)  
$ van.deliver_working_bikes(docking_station)  
$ docking_station.stored_bikes  
$ docking_station.release_bike  
$ docking_station.dock(bike1)  


## Contributing

If you have any suggestions, please create a GitHub issue, or feel free to make a pull request!
