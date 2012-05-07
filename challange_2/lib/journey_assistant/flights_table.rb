module JourneyAssistant
  class FlightsTable
    attr_reader :table

    def initialize(data_set)
      @table ||= []
      build_flights(data_set)
    end

    def method_missing(m, *args, &block)
      if /^[^_]*_to_[^_]*$/ =~ m
        @routes = []
        @routes_table ||= {}
        from, m, to = m.to_s.split('_')
        @routes_table["#{from}_to_#{to}".to_s] = find_route(from, to, args.first)
      else
        super(m, *args, &block)
      end
    end

  private
    def find_route(from, to, time, route=nil)
      routes(from, time).each do |flight|
        build_route = (route.nil?)? Route.new : route.clone
        build_route.add_flight(flight)

        if flight.to == to
          @routes << build_route
        else
          find_route(flight.to, to, flight.arrival, build_route)
        end
      end
      @routes
    end

    def routes(from, at)
      @table.select { |flight| flight.from == from && flight.departure > at }
    end

    def build_flights(flights)
      flights.each do |flight|
        @table << Flight.new(flight.row.to_s)
      end
    end
  end
end
