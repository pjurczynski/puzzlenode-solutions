# from, to, start, end, cost
# course,    time_span
# return enumerator!
module JourneyAssistant
  class Flight
    # it is expected to get a data row
    def initialize(data)
      @from, @to, @departure, @arrival, @cost = data
    end
  end
end
