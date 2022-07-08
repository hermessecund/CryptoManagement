# frozen_string_literal: true

require_relative '../../src/Operation'

class OperationParser
  def operation_to_json(operation)
    return json_operation = {
      'coin_price' => operation.coinPrice,
      'coin_units' => operation.coinUnits,
      'usd_amount' => operation.usdAmount,
      'type' => operation.type,
      'fee' => operation.fee,
      'note' => operation.note,
      'date' => operation.date
    }
  end

  def json_to_operation(operation)
    return Operation.new(operation['coin_price'], operation['coin_units'], operation['usd_amount'], operation['type'], operation['fee'], operation['note'], operation['date'])
  end
end
