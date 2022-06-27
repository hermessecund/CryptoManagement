require_relative "Portfolio.rb"

class PortfolioManager
    
    def initialize()
        @portfolios = Array.new
    end

    def AddPortfolio(portfolio)
        @portfolios.push(portfolio)
    end

    def GetPortfolio(portfolio, user)
        portfolio = @portfolios.include?(portfolio) ? @portfolios.at(@portfolios.find_index(portfolio)) : nil

        if(portfolio != nil and portfolio.user != user)
            portfolio = nil
        end

        return portfolio
    end

    def GetNumPortfolios
        return @portfolios.length
    end

    def DeletePortfolio(portfolio)
        @portfolios.delete(portfolio)
    end
end