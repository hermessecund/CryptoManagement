require "minitest/autorun"
require "minitest/mock"
require "date"
require_relative "../src/Portfolio.rb"


class PortfolioTest < Minitest::Test

    def setup
        @portfolio = Portfolio.new()
        @antonioCoin = Coin.new("AntonioCoin", "ANC")
        @memeCoin = Coin.new("memeCoin", "MMC")
    end


    def test_GetNumCoins
        assert_equal 0, @portfolio.GetNumCoins
    end

    def test_AddCoin
        @portfolio.AddCoin(@antonioCoin)
        
        assert_equal 1, @portfolio.GetNumCoins
    end

    def test_GetCoinByName_TwoCoinsInPortfolio_ReturnsRequestedCoin
        @portfolio.AddCoin(@memeCoin)

        requestedCoin = @portfolio.GetCoinByName(@memeCoin.name)

        assert_equal "memeCoin", requestedCoin.name
        assert_equal "MMC", requestedCoin.abbreviation
    end

    def test_GetCoinByName_TwoCoinsInPortfolio_RequestedCoinNotExists
        requestedCoin = @portfolio.GetCoinByName("TEST")

        assert_nil requestedCoin
    end

end