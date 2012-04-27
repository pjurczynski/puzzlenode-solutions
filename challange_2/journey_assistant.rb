require_relative 'lib/journey_assistant.rb'

SAMPLE_INPUT_PATH = 'data/sample/sample-input.txt'

File.open SAMPLE_INPUT_PATH do |f|
  @test_cases = JourneyAssistant::DataSet.new(f.lines)
end

@tests = []
@test_cases.data.each do |test|
  @tests << JourneyAssistant::FlightsTable.new(test.data)
end
