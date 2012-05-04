When /^I find avalaible routes to airport "([^"]*)"$/ do |destination|
  steps %Q{ Given I know the flights table }
  pending #add the rest - now I'm busy with airport model
  @start_point = JourneyAssistant::Flight.new("#{@airport} #{@airport} #{@time} #{@time} 0")
  @posibble_routes = @flights.routes(@airport, @time)
  JourneyAssistant::FlightsTable.find_route(@aiport, destination, @time)
end

Then /^I know the duration and the cost of the flight$/ do
  pending # express the regexp above with the code you wish you had
end
