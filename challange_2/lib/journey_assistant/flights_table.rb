module JourneyAssistant
  class FlightsTable
    attr_reader :table, :routes_table

    def initialize(data_set)
      @table ||= []
      @routes_table = {}
      build_flights(data_set)
    end

    def cheapest_route(from, to)
      routes_table(from, to).min_by { |r| r.cost }
    end

    def shortest_route(from, to)
      routes_table(from, to).min_by { |r| r.duration }
    end

    def routes_table(from, to)
      @routes_table["#{from}_to_#{to}"] ||= send("#{from}_to_#{to}", '00:00')
    end

    def best_alternative(from, to, condition)
      routes_table_back = routes_table(from, to).dup
      case condition.keys.first
      when :cost
        @routes_table["#{from}_to_#{to}"] = routes_table(from, to).select { |r| r.cost == condition[:cost].cost }
        @best = shortest_route(from, to)

      when :duration
        @routes_table["#{from}_to_#{to}"] = routes_table(from, to).select { |r| r.duration == condition[:duration].duration }
        @best = cheapest_route(from, to)
      end

      @routes_table["#{from}_to_#{to}"] = routes_table_back
      @best
    end

    # used to find routes from destination A to B
    def method_missing(m, *args, &block)
      if /^[^_]*_to_[^_]*$/ =~ m
        @routes = []
        @routes_table ||= {}
        from, m, to = m.to_s.split('_')
        @routes_table["#{from}_to_#{to}"] = find_route(from, to, args.first)
      else
        super(m, *args, &block)
      end
    end

    def routes(from, at)
      @table.select { |flight| flight.from == from && flight.departure > at }
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

    def build_flights(flights)
      flights.each do |flight|
        @table << Flight.new(flight.row.to_s)
      end
    end
  end
end
