require_relative "Operation.rb"
require_relative "OperationType.rb"
require 'coingecko_ruby'

class Coin
    attr_reader :name, :abbreviation, :operations
    
    def initialize(name, abbreviation)
        @name = name.downcase
        @abbreviation = abbreviation.upcase
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

            @operations.each { |x| addition += x.usdAmount }
    
            return addition / self.GetNumOperations
        end
    end

    def GetTotalExpend
        buyAmount = self.GetTotalMoneyFromOperationType(OperationType::BUY) == nil ? 0 : self.GetTotalMoneyFromOperationType(OperationType::BUY)
        sellAmount = self.GetTotalMoneyFromOperationType(OperationType::SELL) == nil ? 0 : self.GetTotalMoneyFromOperationType(OperationType::SELL)

        return buyAmount - sellAmount
    end

    def GetCurrentPrice
        client = CoingeckoRuby::Client.new
        return client.price(@name.downcase)[@name] == nil ? nil : client.price(@name.downcase)[@name]["usd"]
    end

    def GetTotalMoneyFromOperationType(type)
        if(self.GetNumOperations != 0)
            addition = 0.0;

            buys = @operations.select { |x| x.type == type}
            buys.each { |y| addition += y.usdAmount }

            return addition
        end
    end

    private :GetTotalMoneyFromOperationType
end