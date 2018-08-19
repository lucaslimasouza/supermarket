require 'spec_helper'
require 'rules/total_percentage_discount'

RSpec.describe TotalPercentageDiscount do
  subject(:total_percentage_discount) do
    TotalPercentageDiscount.new(
      threshold: 30,
      discount: 10,
      operator: '>'
    )
  end

  describe '#apply' do
    context 'spend over 30 then order get 10% off' do
      it 'return an order with new total value' do
        order = {
          '001' => { qty: 2, price: 1.95 },
          '002' => { qty: 5, price: 5.99 },
          total: 33.85
        }
        order_with_discount = subject.apply order

        expect(order_with_discount[:total]).to eq 30.46
      end
    end
  end
end
