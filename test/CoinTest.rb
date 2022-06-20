require "minitest/autorun"
require "minitest/mock"
require "date"
require_relative "../src/Coin.rb"
require_relative "../src/Operation.rb"
require_relative "../src/OperationType.rb"


class CoinTest < Minitest::Test

    def setup
        @antonioCoin = Coin.new("AntonioCoin", "ANC")
        @antonioCoin2 = Coin.new("AntonioCoin2", "ANC")
        @operation = Operation.new(1.2, 10, 200, OperationType::BUY, 1, 'BUY AntonioCoin', DateTime.now())
        @operation2 = Operation.new(1.3, 30, 300, OperationType::BUY, 3, 'BUY AntonioCoin2', DateTime.now())
    end


    def test_GetNumOperations
        assert_equal 0, @antonioCoin.GetNumOperations
    end

    def test_AddOperation
        @antonioCoin.AddOperation(@operation)
        
        assert_equal 1, @antonioCoin.GetNumOperations
    end

    def test_DeleteOperation
        @antonioCoin.DeleteOperation(@operation)

        assert_equal 0, @antonioCoin.GetNumOperations
    end

    def test_GetOperation_OperationExists_OperationReturned
        @antonioCoin.AddOperation(@operation)
        @antonioCoin.AddOperation(@operation2)
        
        operation = @antonioCoin.GetOperation(@operation)

        refute_nil operation
        assert_equal 'BUY AntonioCoin', operation.note
    end

    def test_GetOperation_OperationNotExists_NoOperationReturned
        @antonioCoin.AddOperation(@operation2)
        
        operation = @antonioCoin.GetOperation(@operation)

        assert_nil operation
    end
end