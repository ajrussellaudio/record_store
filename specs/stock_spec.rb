require "minitest/autorun"
require "minitest/rg"

require_relative "../models/stock"

class TestStock < MiniTest::Test

  def setup
    @test_stock = Stock.new({
      'album_id' => 0,
      'format' => 'vinyl',
      'buy_price' => 6.50,
      'sell_price' => 10.00,
      'current_stock_level' => 10,
      'reorder_threshold' => 2,
      })
  end

  def test_margin
    assert_equal( 35, @test_stock.margin)
  end


end
