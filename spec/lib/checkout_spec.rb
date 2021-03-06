require 'spec_helper'
require 'checkout'

RSpec.describe Checkout do
  let!(:curry_sauce) { instance_double('Product', code: '001', price: 1.95) }

  let!(:pizza) { instance_double('Product', code: '002', price: 5.99) }

  let!(:t_shirt) { instance_double('Product', code: '003', price: 25) }

  describe '#total' do
    context 'no promotional rules' do
      subject(:checkout) { Checkout.new([]) }

      it 'return total no discount' do
        subject.scan(curry_sauce)
        subject.scan(pizza)

        expect(subject.total).to eq 7.94
      end
    end

    context 'with total percentage discount' do
      let!(:total_percentage_discount) do
        instance_double('TotalPercentageDiscount', apply: { total: 29.65 })
      end
      let!(:promotional_rules) { [total_percentage_discount] }
      subject(:checkout) { Checkout.new(promotional_rules) }

      it 'return total with discount' do
        subject.scan(curry_sauce)
        subject.scan(pizza)
        subject.scan(t_shirt)

        expect(subject.total).to eq 29.65
      end
    end

    context 'with product discount' do
      let!(:product_discount) do
        instance_double('ProductDiscount', apply: { total: 9.93 })
      end
      let!(:promotional_rules) { [product_discount] }
      subject(:checkout) { Checkout.new(promotional_rules) }

      it 'return total with discount' do
        subject.scan(pizza)
        subject.scan(curry_sauce)
        subject.scan(pizza)

        expect(subject.total).to eq 9.93
      end
    end

    context 'with product and total percentage discount' do
      let!(:product_discount) do
        instance_double('ProductDiscount', apply: { total: 34.93 })
      end

      let!(:total_percentage_discount) do
        instance_double('TotalPercentageDiscount', apply: { total: 31.44 })
      end

      let!(:promotional_rules) { [product_discount, total_percentage_discount] }
      subject(:checkout) { Checkout.new(promotional_rules) }

      it 'return total with discount' do
        subject.scan(pizza)
        subject.scan(curry_sauce)
        subject.scan(pizza)
        subject.scan(t_shirt)

        expect(subject.total).to eq 31.44
      end
    end
  end
end
