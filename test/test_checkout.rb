require 'minitest/autorun'
require_relative '../lib/checkout'
require_relative '../lib/product'
require 'debug'

class TestCheckout < Minitest::Test
  def setup
    @checkout = Checkout.new(Product::PRICING_RULES)
  end

  def test_total_for_items_a
    items = %w[GR1 SR1 GR1 GR1 CF1]
    items.each do |item|
      @checkout.scan(item)
    end
    assert_equal 22.45, @checkout.total
  end

  def test_total_for_items_b
    items = %w[GR1 GR1]
    items.each do |item|
      @checkout.scan(item)
    end
    assert_equal 3.11, @checkout.total
  end

  def test_total_for_items_c
    items = %w[SR1 SR1 GR1 SR1]
    items.each do |item|
      @checkout.scan(item)
    end
    assert_equal 16.61, @checkout.total
  end
  
  def test_total_for_items_d
    items = %w[GR1 CF1 SR1 CF1 CF1]
    items.each do |item|
      @checkout.scan(item)
    end
    assert_equal 30.57, @checkout.total
  end
end