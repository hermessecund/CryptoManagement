# frozen_string_literal: true

require_relative '../../src/Coin'
require_relative '../Parser/OperationParser'

class CoinParser
  def initialize
    @operation_parser = OperationParser.new
  end

  def coin_to_json(coin)
    operations = []
    for i in 0..coin.num_operations-1
      operation = @operation_parser.operation_to_json(coin.operations[i])
      operations.push(operation)
    end

    return json_coin = {
      'name' => coin.name,
      'abbreviation' => coin.abbreviation,
      'operations' => operations
    }
  end

  def json_to_coin(json_coin)
    coin = Coin.new(json_coin['name'], json_coin['abbreviation'])

    for i in 0..json_coin['operations'].length()-1
      coin.add_operation((@operation_parser.json_to_operation(json_coin['operations'][i])))
    end

    return coin
  end
end
