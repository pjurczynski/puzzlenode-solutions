module JourneyAssistant
  class Route
    attr_accessor :route

    def initialize(route = [])
      @route = route
    end

    def add_flight(flight)
      route.push flight
      return self
    end

    def clone
      Route.new route.clone
    end

    def cost
      return route.first.cost if route.length == 1
      route.inject(0) { |sum, flight| sum + flight.cost }
    end

    def first
      route.first
    end

    def last
      route.last
    end

    #estimate cost, estimate duration
  end
end
