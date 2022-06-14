require_relative "Coin.rb"

class Portfolio

    def initialize
        @coins = Array.new
    end

    def addCoin(Coin coin)
        @coins.push(coin)
    end

    def getNumCoins
        return @coins.length
    end
    
end