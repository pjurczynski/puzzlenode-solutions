require_relative '../../lib/journey_assistant/flight'

Given /^a table in "([^"]*)"$/ do |flight_table|
  @f = File.open(flight_table)
end

When /^I read it$/ do
  @flights = JourneyAssistant::FlightReader.readCommands(@f)
end

Then /^I should know what's in it$/ do
  @flights.should be_a_kind_of Enumerator
end
