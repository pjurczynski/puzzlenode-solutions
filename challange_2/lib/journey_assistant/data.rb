module JourneyAssistant

  class DataSet
    attr_reader :data

    def initialize(data)
      @data ||= []
      begin 
        current_row = data.next.strip!
        peek_row    = data.peek.strip
        return if current_row.nil?
      end while current_row.empty?

      if current_row =~ /^\d*$/
        rows = current_row.to_i.times
        peek_row.empty? ? rows.each { @data << DataSet.new(data) } : rows.each { @data << DataRow.new(data) }
      end
    end

    def each
      data.each
    end
  end

  class DataRow
    attr_reader :row

    def initialize(data)
      @row = data.next.to_s.strip
    end
  end
end
