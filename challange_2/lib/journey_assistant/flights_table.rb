module JourneyAssistant
  class FlightsTable
    attr_reader :table

    def initialize(data_set)
      @table ||= []
      build_flights(data_set)
    end

    def random_flight
      @table.sample
    end

    def routes(from, at)
    end

    private
    def build_flights(flights)
      flights.each do |flight|
        @table << Flight.new(flight.row.to_s)
      end
    end
  end
end
