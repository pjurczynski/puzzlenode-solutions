Given /^I am on the airport "([^"]*)" at "([^"]*)"$/ do |airport_departure, time|
  @airport = airport_departure
  @time = time
end

Given /^I know the "([^"]*)" flights table$/ do |test_number|
  steps %Q{
    Given a table in "data/sample/sample-input.txt"
    When I read it
      And I get the "#{test_number}" test case
    Then I should know what's in it
  }
  @flights.should be_a_kind_of JourneyAssistant::FlightsTable
end

When /^I ask about what are possible routes for me$/ do
  @flights_to = @flights.routes(@airport, @time)
  @flights_to.should be_a_kind_of Array
  @flights_to.each { |flight| flight.from.should be == @airport }
  @flights_to.each { |flight| flight.departure.should be > @time }
end

Then /^I should know that I can go to "([^"]*)" at "([^"]*)"$/ do |airport, departure|
  flight = @flights_to.find { |flight| flight.to == "B" && flight.departure == "09:00" }
  flight.to.should be == "B"
  flight.departure.should be == "09:00"
end
