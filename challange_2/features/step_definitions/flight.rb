require_relative '../../lib/journey_assistant/flight'
Given /^a sample flight "([^"]*)"$/ do |flight|
  @flight = JourneyAssistant::Flight.new(flight)
end

Then /^you know its details "([^"]*)"$/ do |flight|
  from, to, departure, arrival, cost = flight.split(' ')
  @flight.from.should == from
  @flight.to.should == to
  @flight.departure.should == departure
  @flight.arrival.should == arrival
  @flight.cost.should == cost.to_f
end

