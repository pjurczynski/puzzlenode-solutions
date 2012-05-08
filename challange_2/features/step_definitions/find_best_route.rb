When /^find shortest alternatives$/ do
  @best = @flights.best_alternative(@from, @to, :cost => @cheapest)
end

Then /^the duration is "([^"]*)"$/ do |duration|
  @best.duration.should be == duration.to_i
end

When /^find cheapest alternatives$/ do
  @best = @flights.best_alternative(@from, @to, :duration => @shortest)
end

Then /^the cost is "([^"]*)"$/ do |cost|
  @best.cost.should be == cost.to_f
end

