When /^I find avalaible routes to airport "([^"]*)"$/ do |destination|
  steps %Q{ Given I know the flights table }
  @destination = destination
  
  @routes = @flights.A_to_Z(@time)
end

Then /^I know the duration and the cost of the flight$/ do
  @routes.each { |route| route.should be_a_kind_of JourneyAssistant::Route }
  @routes.each { |route| route.first.from.should be == "A" }
  @routes.each { |route| route.last.to.should be == "Z" }
end
