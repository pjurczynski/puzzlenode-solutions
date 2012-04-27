Given /^I am on the airport "([^"]*)" at "([^"]*)"$/ do |airport_departure, time|
  @airport = airport_departure
  @time = time
end

Given /^I know the flights table$/ do
  steps %Q{
    Given a table in "data/sample/sample-input.txt"
    When I read it
    Then I should know what's in it
  }
  @flights.should be_a_kind_of JourneyAssistant::FlightsTable
end

When /^I ask about what are possible routes for me$/ do
  @flights_to = @flights.routes(@airport, @time)
  @flights_to.should be_a_kind_of JourneyAssistant::FlightsTable
end

Then /^I should know that I can go to "([^"]*)" at "([^"]*)"$/ do |airport, departure|
  pending # express the regexp above with the code you wish you had
end
