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
        @buyOperation = Operation.new(1.2, 10, 200, OperationType::BUY, 1, 'BUY AntonioCoin', DateTime.now())
        @buyOperation2 = Operation.new(1.3, 30, 600, OperationType::BUY, 3, 'BUY AntonioCoin2', DateTime.now())
        @sellOperation = Operation.new(1.3, 30, 100, OperationType::SELL, 3, 'SELL AntonioCoin2', DateTime.now())
    end


    def test_GetNumOperations
        assert_equal 0, @antonioCoin.GetNumOperations
    end

    def test_AddOperation
        @antonioCoin.AddOperation(@buyOperation)
        
        assert_equal 1, @antonioCoin.GetNumOperations
    end

    def test_DeleteOperation
        @antonioCoin.DeleteOperation(@buyOperation)

        assert_equal 0, @antonioCoin.GetNumOperations
    end

    def test_GetOperation_OperationExists_OperationReturned
        @antonioCoin.AddOperation(@buyOperation)
        @antonioCoin.AddOperation(@buyOperation2)
        
        operation = @antonioCoin.GetOperation(@buyOperation)

        refute_nil operation
        assert_equal 'BUY AntonioCoin', operation.note
    end

    def test_GetOperation_OperationNotExists_NoOperationReturned
        @antonioCoin.AddOperation(@buyOperation2)
        
        operation = @antonioCoin.GetOperation(@buyOperation)

        assert_nil operation
    end

    def test_GetAverageBuyPrice_TwoOperationsExists_AveragePriceReturned
        @antonioCoin.AddOperation(@buyOperation)
        @antonioCoin.AddOperation(@buyOperation2)
        
        average = @antonioCoin.GetAverageBuyPrice

        assert_equal 400, average
    end

    def test_GetAverageBuyPrice_NoOperationsExists_NilReturned
        
        average = @antonioCoin.GetAverageBuyPrice

        assert_nil average
    end

    def test_GetTotalExpend_OperationsExists_TotalExpendReturned
        @antonioCoin.AddOperation(@buyOperation)
        @antonioCoin.AddOperation(@buyOperation2)
        @antonioCoin.AddOperation(@sellOperation)
        
        expendAmount = @antonioCoin.GetTotalExpend

        assert_equal 700, expendAmount
    end

    def test_GetTotalExpend_NoOperationsExists_NoTotalExpendReturned
        
        expendAmount = @antonioCoin.GetTotalExpend

        assert_equal 0, expendAmount
    end
end