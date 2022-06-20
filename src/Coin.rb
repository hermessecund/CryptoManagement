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

    def DeleteOperation(operation)
        @operations.delete(operation)
    end

    def GetOperation(operation)
        return @operations.include?(operation) ? @operations.at(@operations.find_index(operation)) : nil
    end

    def GetNumOperations()
        return @operations.length
    end

    def GetAverageBuyPrice
        if(self.GetNumOperations != 0)
            addition = 0.0;

            @operations.each {|x| addition += x.usdAmount}
    
            return addition / self.GetNumOperations
        end
    end
end