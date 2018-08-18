module Operators
  VALID_OPERATORS = ['>', '<', '>=', '<=', '=='].freeze

  def validates(operator)
    raise 'Invalid operator' unless VALID_OPERATORS.include?(operator)
  end
end
