require 'spec_helper'
require 'checkout'

RSpec.describe Checkout do
  let!(:curry_sauce) { instance_double('Product', code: '001', price: 1.95) }
  let!(:pizza) { instance_double('Product', code: '002', price: 5.99) }
  let!(:t_shirt) { instance_double('Product', code: '003', price: 25) }

  describe '#total' do
    context 'no promocional rules' do
      subject(:checkout) { Checkout.new }

      it 'return total without discount' do
        subject.scan(curry_sauce)
        subject.scan(pizza)

        expect(subject.total).to eq 7.94
      end
    end
  end
end
