module JourneyAssistant
  def self.find_all_routes(from, to, time, flights_table, route = nil)
    @routes ||= []

    flights_table.routes(from, time).each do |flight|
      build_route = (route.nil?)? Route.new : route.clone
      build_route.add_flight(flight)

      if flight.to == to
        @routes << build_route
      else
        find_all_routes(flight.to, to, flight.arrival, flights_table, build_route)
      end
    end

    @routes
  end

  def self.clear_routes
    @routes = []
  end
end
