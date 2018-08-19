class Checkout
  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @order = { total: 0 }
  end

  def scan(product)
    if @order.key?(product.code)
      @order[product.code][:qty] += 1
    else
      @order[product.code] = { qty: 1, price: product.price }
    end
    @order[:total] += product.price
  end

  def total
    unless @promotional_rules.empty?
      @promotional_rules.each { |rule| @order = rule.apply(@order) }
    end
    @order[:total].round(2)
  end
end
