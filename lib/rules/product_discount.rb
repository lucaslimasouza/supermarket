require 'rules/operators'

class ProductDiscount
  include Operators

  def initialize(code:, qty:, discount:, operator:)
    @code = code
    @qty = qty
    @discount = discount
    @operator = operator
    validates(@operator)
  end

  def apply(order)
    product_checkout = order[@code]
    if is_valid_rule?(product_checkout)
      order[:total] -= (product_checkout[:qty] * @discount).round(2)
    end
    order
  end

  private

  def is_valid_rule?(product_checkout)
    product_checkout && product_checkout[:qty].public_send(@operator, @qty)
  end
end
