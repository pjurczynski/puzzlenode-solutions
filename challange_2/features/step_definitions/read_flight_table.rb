require_relative '../../lib/journey_assistant/flights_table'
require_relative '../../lib/journey_assistant/data'

Given /^a table in "([^"]*)"$/ do |file_path|
  @file_path = file_path
end

When /^I read it$/ do
  File.open @file_path do |f|
    lines = f.lines
    @raw_data = JourneyAssistant::DataSet.new(lines)
  end
  first_test_case = @raw_data.data[0]
  @flights = JourneyAssistant::FlightsTable.new(first_test_case.data)
end

Then /^I should know what's in it$/ do
  @flights.random_flight.should be_a_kind_of JourneyAssistant::Flight
end
