# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../src/Portfolio'

class PortfolioTest < Minitest::Test
  def setup
    @portfolio = Portfolio.new('NameTest', User.new('username', 'password'))
    @antonio_coin = Coin.new('antonio_coin', 'ANC')
    @meme_coin = Coin.new('meme_coin', 'MMC')
  end

  def test_num_coins
    assert_equal 0, @portfolio.num_coins
  end

  def test_add_coin
    @portfolio.add_coin(@antonio_coin)

    assert_equal 1, @portfolio.num_coins
  end

  def test_coin_by_name_two_coins_in_portfolio_returns_requested_coin
    @portfolio.add_coin(@meme_coin)

    requested_coin = @portfolio.coin_by_name(@meme_coin.name)

    assert_equal 1, @portfolio.num_coins
    assert_equal 'meme_coin', requested_coin.name
    assert_equal 'MMC', requested_coin.abbreviation
  end

  def test_coin_by_name_two_coins_in_portfolio_requested_coin_not_exists
    requested_coin = @portfolio.coin_by_name('TEST')

    assert_nil requested_coin
  end

  def test_coin_two_coins_in_portfolio_requested_coin_exists
    @portfolio.add_coin(@meme_coin)
    @portfolio.add_coin(@antonio_coin)

    requested_coin = @portfolio.coin(@meme_coin)

    refute_nil requested_coin
    assert_equal 'meme_coin', requested_coin.name
    assert_equal 'MMC', requested_coin.abbreviation
  end

  def test_coin_one_coin_in_portfolio_requested_coin_not_exists
    @portfolio.add_coin(@meme_coin)

    requested_coin = @portfolio.coin(@antonio_coin)

    assert_nil requested_coin
  end

  def test_delete_coin_two_coins_in_portfolio_deleted_one_coin
    @portfolio.add_coin(@meme_coin)
    @portfolio.add_coin(@antonio_coin)

    deleted_coin = @portfolio.delete_coin(@meme_coin)

    assert_equal 1, @portfolio.num_coins
    assert_equal 'meme_coin', deleted_coin.name
    assert_equal 'MMC', deleted_coin.abbreviation
  end

  def test_delete_coin_one_coin_in_portfolio_no_deleted_coin
    @portfolio.add_coin(@antonio_coin)

    deleted_coin = @portfolio.delete_coin(@meme_coin)

    assert_nil deleted_coin
  end

  def test_set_name_one_coin_in_portfolio_name_changed
    @portfolio.add_coin(@meme_coin)

    @portfolio.name = 'PortFolioTest'

    assert_equal 'PortFolioTest', @portfolio.name
  end
end
