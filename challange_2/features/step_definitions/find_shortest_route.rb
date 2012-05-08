When /^calculate the shortest way$/ do
  @shortest = @flights.shortest_route(@from, @to)
end

Then /^I know that the shortest route from "([^"]*)" to "([^"]*)" is "([^"]*)"$/ do |from, to, time|
  @shortest.should be == time.to_i
end

