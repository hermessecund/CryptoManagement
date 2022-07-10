# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../src/DataAccess/Dator'

class DatorTest < Minitest::Test
  def test_dator
    assert_raises(StandardError, 'Non-instantiable class') { Dator.new }
  end
end
