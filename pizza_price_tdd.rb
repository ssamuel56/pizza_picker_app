require 'minitest/autorun'
require_relative 'pizza_price.rb'

class Pizza < Minitest::Test
  def test_to_make_one_small
    assert_equal(5, pizza_price(5, size))
  end  
end
