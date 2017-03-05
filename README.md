## Boris Bike Challenge
#### Technologies: Ruby, RSpec
### Week 1 pair programming challenge for [Makers Academy] (http://www.makersacademy.com)
[Outline](#outline) | [User Stories](#userstories) | [Usage Instructions](#usageinstructions) 

## Brief
Let's go back several years, to the days when there were no Boris Bikes. Imagine that you're a junior developer (that was easy). Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

## Outline
For our first project at Makers Academy we were introduced to the principles of TDD and object oriented design.  We were given a set of user stories and asked to build a simple command line application, creating feature tests then writing the code to allow them to pass.

## User Stories

```
As a member of the public,
So that I can use a bike,
I'd like a docking station to release a bike.

As a member of the public,
So that I can use a good bike,
I'd like to see if a bike is working.

As a member of the public,
So that I can use a bike,
I'd like to get a bike from a docking station.

As a member of the public,
So that I can use a good bike,
I'd like to see if a bike is working.

As a member of the public,
So I can return bikes I've hired,
I want to dock my bike at the docking station.

As a member of the public,
So I can decide whether to use the docking station,
I want to see a bike that has been docked.

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a system maintainer,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).
```

## Usage Instructions
* clone the repo and run bundle
```shell
$ git clone https://github.com/samjones1001/boris-bikes
$ cd boris-bikes
$ bundle
```
* run the application in irb

```shell
$ irb
2.3.0 :001 > require './lib/docking_station'
 => true 
2.3.0 :002 > bike = Bike.new
 => #<Bike:0x00000001373b78> 
2.3.0 :003 > station = DockingStation.new
 => #<DockingStation:0x000000013679e0 @bikes=[], @capacity=20> 
2.3.0 :004 > station.dock_bike(bike)
 => [#<Bike:0x00000001373b78>] 
2.3.0 :005 > station.release_bike
 => #<Bike:0x00000001373b78> 
```
