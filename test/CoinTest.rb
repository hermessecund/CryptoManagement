# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../src/Coin'

class CoinTest < Minitest::Test
  def setup
      @antonioCoin = Coin.new("AntonioCoin", "ANC")
      @antonioCoin2 = Coin.new("AntonioCoin2", "ANC")
      @bitcoin = Coin.new("Bitcoin", "BTC")
      @buyOperation = Operation.new(20, 10, 200, OperationType::BUY, 1, 'BUY AntonioCoin', DateTime.now())
      @buyOperation2 = Operation.new(10, 20, 600, OperationType::BUY, 3, 'BUY AntonioCoin2', DateTime.now())
      @sellOperation = Operation.new(5, 5, 100, OperationType::SELL, 3, 'SELL AntonioCoin2', DateTime.now())
  end

  def test_num_operations
    assert_equal 0, @antonioCoin.num_operations
  end

  def test_add_operation
    @antonioCoin.add_operation(@buyOperation)

    assert_equal 1, @antonioCoin.num_operations
  end

  def test_delete_operation
    @antonioCoin.delete_operation(@buyOperation)

    assert_equal 0, @antonioCoin.num_operations
  end

  def test_operation_operation_exists_operation_returned
    @antonioCoin.add_operation(@buyOperation)
    @antonioCoin.add_operation(@buyOperation2)

    operation = @antonioCoin.operation(@buyOperation)

    refute_nil operation
    assert_equal 'BUY AntonioCoin', operation.note
  end

  def test_operation_operation_not_exists_no_operation_returned
    @antonioCoin.add_operation(@buyOperation2)

    operation = @antonioCoin.operation(@buyOperation)

    assert_nil operation
  end

  def test_total_units_some_operations_total_unit_returned
    @antonioCoin.add_operation(@buyOperation)
    @antonioCoin.add_operation(@buyOperation2)
    @antonioCoin.add_operation(@sellOperation)

    units = @antonioCoin.total_units

    assert_equal 25, units
  end

  def test_total_units_no_operations_no_units_returned
    units = @antonioCoin.total_units

    assert_nil units
  end

  def test_average_buy_price_two_operations_exists_average_price_returned
    @antonioCoin.add_operation(@buyOperation)
    @antonioCoin.add_operation(@buyOperation2)

    average = @antonioCoin.average_buy_price

    assert_equal 13.333333333333334, average
  end

  def test_average_buy_price_no_operation_exists_nil_returned
    average = @antonioCoin.average_buy_price

    assert_nil average
  end

  def test_total_expend_operations_exists_total_expend_returned
    @antonioCoin.add_operation(@buyOperation)
    @antonioCoin.add_operation(@buyOperation2)
    @antonioCoin.add_operation(@sellOperation)

    expended_amount = @antonioCoin.total_expend

    assert_equal 700, expended_amount
  end

  def test_total_expend_no_operations_exists_no_total_expend_returned
    expended_amount = @antonioCoin.total_expend

    assert_equal 0, expended_amount
  end

  def test_current_price_asset_exists_price_returned
    price = @bitcoin.current_price

    assert_operator price, :>, 0
  end

  def test_current_price_asset_does_not_exist_no_price_returned
    price = @antonioCoin.current_price

    assert_nil price
  end
end
