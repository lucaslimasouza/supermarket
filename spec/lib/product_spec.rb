require 'product'

RSpec.describe Product do
  subject(:product) { Product.new(code: '001', name: 'Product name', price: 195) }

  describe '#code' do
    it "return the code's value" do
      expect(subject.code).to eq '001'
    end
  end
end
