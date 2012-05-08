require_relative 'lib/journey_assistant.rb'
require 'debugger'
SAMPLE_INPUT_PATH = 'data/sample/sample-input.txt'
INPUT_PATH        = 'data/input.txt'

File.open INPUT_PATH do |f|
  @test_cases = JourneyAssistant::DataSet.new(f.lines)
end

@tests = []
@test_cases.data.each do |test|
  @tests << JourneyAssistant::FlightsTable.new(test.data)
end

from, to = "A", "Z"

output = File.open('./output.txt', 'w') do |f|
  @tests.each do |test|
    f.puts test.best_alternative(from, to, :cost => test.cheapest_route(from, to))
    f.puts test.best_alternative(from, to, :duration => test.shortest_route(from, to))
    f.puts
  end
end
