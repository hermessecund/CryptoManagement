# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../src/PortfolioManager'

class PortfolioManagerTest < Minitest::Test
  def setup
    @portfolio_manager = PortfolioManager.new()
    @portfolio = Portfolio.new('one_portfolio', User.new('username', 'password'))
    @portfolio2 = Portfolio.new('another_portfolio', User.new('username', 'password'))
  end

  def test_add_portfolio
    @portfolio_manager.add_portfolio(@portfolio)

    assert_equal 1, @portfolio_manager.num_portfolios
    assert_equal 'one_portfolio', @portfolio_manager.portfolio(@portfolio, User.new('username', 'password')).name
  end

  def test_portfolio_portfolio_exists_portfolio_returned
    @portfolio_manager.add_portfolio(@portfolio)

    assert_equal 1, @portfolio_manager.num_portfolios
    assert_equal 'one_portfolio', @portfolio_manager.portfolio(@portfolio, User.new('username', 'password')).name
  end

  def test_portfolio_portfolio_does_not_exist_nil_returned
    @portfolio_manager.add_portfolio(@portfolio)

    assert_equal 1, @portfolio_manager.num_portfolios
    assert_nil @portfolio_manager.portfolio(@portfolio2, User.new('username', 'password'))
  end

  def test_delete_portfolio_portfolio_exists_portfolio_removed
    @portfolio_manager.add_portfolio(@portfolio)
    @portfolio_manager.add_portfolio(@portfolio2)

    @portfolio_manager.delete_portfolio(@portfolio)

    assert_equal 1, @portfolio_manager.num_portfolios
    assert_equal 'another_portfolio', @portfolio_manager.portfolio(@portfolio2, User.new('username', 'password')).name
  end

  def test_delete_portfolio_portfolio_does_not_exists_portfolio_not_removed
    @portfolio_manager.add_portfolio(@portfolio2)

    @portfolio_manager.delete_portfolio(@portfolio)

    assert_equal 1, @portfolio_manager.num_portfolios
  end
end
