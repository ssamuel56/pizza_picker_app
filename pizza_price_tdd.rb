require 'minitest/autorun'
require_relative 'pizza_price.rb'

class Pizza < Minitest::Test
  def test_to_make_one_small
    size = "small"
    assert_equal(10, pizza_price(5, size))
  end
  def test_to_make_one_medium
    size = "medium"
    assert_equal(14, pizza_price(7, size))
  end
  def test_to_make_one_small
    size = "large"
    assert_equal(13, pizza_price(3, size))
  end
end
