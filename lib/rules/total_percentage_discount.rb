require_relative 'operators'

class TotalPercentageDiscount
  include Operators

  def initialize(threshold:, discount:, operator:)
    @threshold = threshold
    @discount = discount
    @operator = operator
    validates(@operator)
  end

  def apply(order)
    order[:total] -= (order[:total] * @discount / 100).round(2) if is_valid_rule?(order)
    order
  end

  private

  def is_valid_rule?(order)
    order[:total].public_send(@operator, @threshold)
  end
end
