require_relative "Coin.rb"

class Portfolio

    def initialize
        @coins = Array.new
    end

    def AddCoin(coin)
        @coins.push(coin)
    end

    def GetCoin(coin)
        return @coins.include?(coin) ? @coins.at(@coins.find_index(coin)) : nil
    end

    def DeleteCoin(coin)
        @coins.delete(coin)
    end

    def GetCoinByName(name)
        found = false
		coin = nil
		i = 0
		
		while i < @coins.length() and !found																								#Si no es sigla, buscamos por nombre (nos han proporcionado nombre)
			if(@coins[i].name == name)
				found = true
				coin = @coins[i]
			end
			i +=1
		end

        return coin
    end

    def GetNumCoins
        return @coins.length
    end

end