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

    # TODO: DRY it
    def cost
      return route.first.cost if route.length == 1
      route.inject(0) { |sum, flight| sum + flight.cost }
    end

    def duration
      return route.first.duration if route.length == 1
      start  = JourneyAssistant::in_minutes(first.departure)
      finish = JourneyAssistant::in_minutes(last.arrival)
      finish - start
    end

    def first
      route.first
    end

    def last
      route.last
    end

    def to_s
      [first.departure, last.arrival, cost.to_s('F')].join(' ')
    end
  end
end
