require_relative "test_helper"
require_relative "../src/Coin.rb"


class CoinTest < Minitest::Test

    def setup
        @antonioCoin = Coin.new("AntonioCoin", "ANC")
        @antonioCoin2 = Coin.new("AntonioCoin2", "ANC")
        @bitcoin = Coin.new("Bitcoin", "BTC")
        @buyOperation = Operation.new(20, 10, 200, OperationType::BUY, 1, 'BUY AntonioCoin', DateTime.now())
        @buyOperation2 = Operation.new(10, 20, 600, OperationType::BUY, 3, 'BUY AntonioCoin2', DateTime.now())
        @sellOperation = Operation.new(5, 5, 100, OperationType::SELL, 3, 'SELL AntonioCoin2', DateTime.now())
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

    def test_GetTotalUnits_SomeOperations_TotalUnitsReturned
        @antonioCoin.AddOperation(@buyOperation)
        @antonioCoin.AddOperation(@buyOperation2)
        @antonioCoin.AddOperation(@sellOperation)
        
        units = @antonioCoin.GetTotalUnits

        assert_equal 25, units
    end

    def test_GetTotalUnits_NoOperations_NoUnitsReturned
        units = @antonioCoin.GetTotalUnits

        assert_nil units
    end

    def test_GetAverageBuyPrice_TwoOperationsExists_AveragePriceReturned
        @antonioCoin.AddOperation(@buyOperation)
        @antonioCoin.AddOperation(@buyOperation2)
        
        average = @antonioCoin.GetAverageBuyPrice

        assert_equal 13.333333333333334, average
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

    def test_GetCurrentPrice_AssetExist_PriceReturned
        price = @bitcoin.GetCurrentPrice

        assert_operator price, :>, 0
    end

    def test_GetCurrentPrice_AssetDoesNotExist_NoPriceReturned
        price = @antonioCoin.GetCurrentPrice

        assert_nil price
    end
end