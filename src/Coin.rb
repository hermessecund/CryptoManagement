# frozen_string_literal: true

require_relative 'Operation'
require_relative 'OperationType'
require 'coingecko_ruby'

# Represents an asset
class Coin
  attr_reader :name, :abbreviation, :operations

  def initialize(name, abbreviation)
    @name = name.downcase
    @abbreviation = abbreviation.upcase
    @operations = []
  end

  def add_operation(operation)
    @operations.push(operation)
  end

  def delete_operation(operation)
    @operations.delete(operation)
  end

  def operation(operation)
    @operations.include?(operation) ? @operations.at(@operations.find_index(operation)) : nil
  end

  def num_operations
    @operations.length
  end

  def average_buy_price
    if num_operations != 0

      addition = 0.0
      i = 0

      while i < @operations.length
        if @operations[i].type == OperationType::BUY
          addition += @operations[i].coinUnits * @operations[i].coinPrice
        end
        i += 1
      end
      addition / total_units
    end
  end

  def total_units
    addition = 0
    i = 0

    while i < @operations.length
      if @operations[i].type == OperationType::BUY
        addition += @operations[i].coinUnits
      else
        addition -= @operations[i].coinUnits
      end
      i += 1
    end

    addition != 0 ? addition : nil
  end

  def total_expend
    buy = total_money_from_operation_type(OperationType::BUY)
    sell = total_money_from_operation_type(OperationType::SELL)
    buy_amount = buy.nil? ? 0 : buy
    sell_amount = sell.nil? ? 0 : sell

    buy_amount - sell_amount
  end

  def current_price
    client = CoingeckoRuby::Client.new

    client.price(@name.downcase)[@name].nil? ? nil : client.price(@name.downcase)[@name]['usd']
  end

  def actual_total_money
    current_price * total_units
  end

  def total_money_from_operation_type(type)
    if num_operations != 0
      addition = 0.0

      buys = @operations.select { |x| x.type == type }
      buys.each { |y| addition += y.usdAmount }

      addition
    end
  end

  private :total_money_from_operation_type
end
