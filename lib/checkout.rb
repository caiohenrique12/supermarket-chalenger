class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @basket = Hash.new(0)
  end

  def total
    @basket.sum do |item, quantity|
      product = @pricing_rules[item.to_sym]
      calculate(quantity, product)
    end.round(2)
  end

  def scan(item)
    @basket[item] += 1
  end

  private

  def calculate(quantity, product)
    sub_total = product[:price] * quantity

    if eligible_for_discount?(quantity, product[:quantities_to_discount])
      sub_total -= calculate_discount(product)
    end

    sub_total
  end

  def eligible_for_discount?(quantity, quantities_to_discount)
    quantity >= quantities_to_discount
  end

  def calculate_discount(product)
    (product[:price] * product[:quantities_to_discount]) * product[:discount_value]
  end
end