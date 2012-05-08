Given /^a "([^"]*)" flight table with all routes from "([^"]*)" to "([^"]*)" starting at "([^"]*)"$/ \
  do |test_number, from, to, at|

  @from = from
  @to = to
  steps %Q{
    Given I am on the airport "#{from}" at "#{at}"
    And I know the "#{test_number}" flights table
    When I find avalaible routes to airport "#{to}"
  }
end

When /^calculate the cheapest way$/ do
  @cheapest = @flights.cheapest_route(@from, @to)
end

Then /^I know that the cheapest route from "([^"]*)" to "([^"]*)" is "([^"]*)"$/ do |from, to, cost|
  @cheapest.should be == cost.to_f

end
