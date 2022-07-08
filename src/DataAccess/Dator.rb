# frozen_string_literal: true

class Dator
  def initialize
    if self.instance_of? Dator
      raise 'Non-instantiable class'
    end
  end

  def add_coin(coin)
    raise 'Method must be implemented'
  end

  def delete_coin(grado_id)
    raise 'Method must be implemented'
  end

  def coin(coin_id)
    raise 'Method must be implemented'
  end

  def all_coins(portfolio_id)
    raise 'Method must be implemented'
  end

  def add_operation(operation_id, coin_id)
    raise 'Method must be implemented'
  end

  def delete_operation(operation_id, coin_id)
    raise 'Method must be implemented'
  end

  def operation(operation_id, coin_id)
    raise 'Method must be implemented'
  end

  def all_operations(coin_id)
    raise 'Method must be implemented'
  end

  def add_portfolio(portfolio_id, user_id)
    raise 'Method must be implemented'
  end

  def delete_portfolio(portfolio_id, user_id)
    raise 'Method must be implemented'
  end

  def portfolio(portfolio_id, user_id)
    raise 'Method must be implemented'
  end

  def all_portfolios(user_id)
    raise 'Method must be implemented'
  end
end
