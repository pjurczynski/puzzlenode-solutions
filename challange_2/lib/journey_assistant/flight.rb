# from, to, start, end, cost
# course,    time_span
module JourneyAssistant
  class Flight
    # it is expected to get a data row
    def initialize(data)
      @from, @to, @departure, @arrival, @cost = data
    end
  end

  class FlightReader
    def self.readCommands(file)
      line = file.readline.strip!
      if line =~ /^\d*$/
        line.to_i.times { readCommands(file) }
        # if just N then invoke the same command N times omitting the next line
        # if long line, then return return it as an array
      if
    end
  end
end
