require 'minitest/autorun'
require_relative 'pizza_price.rb'

class Pizza < Minitest::Test
  def test_to_make_one_small
    size = ["small"]
    assert_equal(6, pizza_price(1, size))
  end
  def test_to_make_one_medium
    size = ["medium"]
    assert_equal(8, pizza_price(1, size))
  end
  def test_to_make_one_large
    size = ["large"]
    assert_equal(11, pizza_price(1, size))
  end
end
