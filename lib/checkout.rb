class Checkout
  def initialize
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
    @order[:total]
  end
end
