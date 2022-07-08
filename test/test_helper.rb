# frozen_string_literal: true

if ENV['COVERAGE'] == 'TRUE'
  require 'simplecov'
end

require 'minitest/autorun'
require 'minitest/mock'
require 'date'
require 'coingecko_ruby'
