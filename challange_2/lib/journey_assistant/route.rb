module JourneyAssistant
  class Route
    def initialize(route = [])
      @route = route
    end

    def add_flight(flight)
      @route.push flight
      return self
    end

    def clone
      Route.new @route.clone
    end

    attr_writer :route

    #estimate cost, estimate duration
  end
end
