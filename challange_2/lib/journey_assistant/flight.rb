# from, to, start, end, cost
# course,    time_span
# return enumerator!
module JourneyAssistant
  class Flight
    # it is expected to get a data row
    attr_reader :from, :to, :departure, :arrival, :cost
    def initialize(data)
      @from, @to, @departure, @arrival, @cost = data.split(' ')
    end
  end
end
