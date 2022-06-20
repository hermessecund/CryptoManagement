require "minitest/autorun"
require "minitest/mock"
require "date"
require_relative "../src/Coin.rb"
require_relative "../src/Operation.rb"
require_relative "../src/OperationType.rb"


class CoinTest < Minitest::Test

    def setup
        @antonioCoin = Coin.new("AntonioCoin", "ANC")
        @operation = Operation.new(1.2, 10, 200, OperationType::BUY, 1, 'BUY AntonioCoin', DateTime.now())
    end


    def test_GetNumOperations
        assert_equal 0, @antonioCoin.GetNumOperations
    end

    def test_AddOperation
        @antonioCoin.AddOperation(@operation)
        
        assert_equal 1, @antonioCoin.GetNumOperations
    end
end