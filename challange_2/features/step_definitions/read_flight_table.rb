Given /^a table in "([^"]*)"$/ do |file_path|
  @file_path = file_path
end

When /^I read it$/ do
  File.open @file_path do |f|
    lines = f.lines
    @raw_data = JourneyAssistant::DataSet.new(lines)
  end
end

When /^I get the "([^"]*)" test case$/ do |test_number|
  first_test_case = @raw_data.data[test_number.to_i]
  @flights = JourneyAssistant::FlightsTable.new(first_test_case.data)
end

Then /^I should know what's in it$/ do
  @flights.table[0].should be_a_kind_of JourneyAssistant::Flight
end
