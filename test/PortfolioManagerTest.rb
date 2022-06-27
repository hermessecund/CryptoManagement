require "minitest/autorun"
require "minitest/mock"
require_relative "../src/PortfolioManager.rb"
require_relative "../src/Portfolio.rb"

class PortfolioManagerTest < Minitest::Test

    def setup
        @portfolioManager = PortfolioManager.new()
        @portfolio = Portfolio.new("onePortfolio")
    end

    def test_addPortfolio
        @portfolioManager.AddPortfolio(@portfolio)

        assert_equal 1, @portfolioManager.GetNumPortfolios
        assert_equal "onePortfolio", @portfolioManager.GetPortfolio(@portfolio).name
    end

end