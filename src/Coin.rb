class Coin
    attr_reader :name, :abbreviation, :operations

    def initialize(name, abbreviation)
        @name = name
        @abbreviation = abbreviation
        @operations = Array.new
    end

    def AddOperation(operation)
        @operations.push(operation)
    end

    def GetNumOperations()
        return @operations.length
    end
end