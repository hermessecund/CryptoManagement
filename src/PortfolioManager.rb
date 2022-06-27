require_relative "Portfolio.rb"

class PortfolioManager
    
    def initialize()
        @portfolios = Array.new
    end

    def AddPortfolio(portfolio)
        @portfolios.push(portfolio)
    end

    def GetPortfolio(portfolio)
        return @portfolios.include?(portfolio) ? @portfolios.at(@portfolios.find_index(portfolio)) : nil
    end

    def GetNumPortfolios
        return @portfolios.length
    end

    def DeletePortfolio(portfolio)
        @portfolios.delete(portfolio)
    end
end