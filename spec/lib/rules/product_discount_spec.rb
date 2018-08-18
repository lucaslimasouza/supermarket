require 'rules/product_discount'

RSpec.describe ProductDiscount do
  subject(:product_discount) do
    ProductDiscount.new(
      code: '002',
      qty: 2,
      discount: 2,
      operator: '>='
    )
  end

  describe '#apply' do
    context 'buy two or more product then the price drops' do
      it 'return an order with new total value' do
        order = {
          '001' => { qty: 1, price: 1.95 },
          '002' => { qty: 2, price: 5.99 },
          total: 13.93
        }

        order_with_discount = subject.apply order

        expect(order_with_discount[:total]).to eq 9.93
      end
    end
  end
end
