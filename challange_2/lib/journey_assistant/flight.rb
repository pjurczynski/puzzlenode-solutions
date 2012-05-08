require 'bigdecimal'
# from, to, start, end, cost
# course,    time_span
# return enumerator!
module JourneyAssistant
  class Flight
    # it is expected to get a data row
    attr_reader :from, :to, :departure, :arrival
    def initialize(data)
      @from, @to, @departure, @arrival, @cost = data.split(' ')
    end

    def cost
      BigDecimal.new(@cost)
    end

    def duration
      JourneyAssistant::in_minutes(@arrival) - JourneyAssistant::in_minutes(@departure)
    end
  end
end
