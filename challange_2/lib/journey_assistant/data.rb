module Data
  class DataSet
    def initialize(data)
      return @data << DataSet.new(data) if data =~ /^\d*$/
      return @data << DataRow.new(data)
    end
  end

  class DataRow
    def initialize(data)
      @data = data
    end
  end
end
