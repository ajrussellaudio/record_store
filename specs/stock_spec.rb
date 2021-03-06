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

  def test_margin__float
    @test_stock.buy_price = 6.67
    assert_equal( 33.3, @test_stock.margin)
  end

  def test_out_of_stock
    assert_equal(false, @test_stock.out_of_stock?)
  end

  def test_out_of_stock__true
    @test_stock.current_stock_level = 0
    assert_equal(true, @test_stock.out_of_stock?)
  end

  def test_below_threshold
    assert_equal(false, @test_stock.below_threshold?)
  end

  def test_below_threshold__true
    @test_stock.current_stock_level = 1
    assert_equal(true, @test_stock.below_threshold?)
  end

  def test_below_threshold__edge
    @test_stock.current_stock_level = 2
    assert_equal(false, @test_stock.below_threshold?)
  end


end
