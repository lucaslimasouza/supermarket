require 'rules/operators'

RSpec.describe Operators do
  let(:object) { klass.new }
  let(:klass) do
    Class.new do
      include Operators
    end
  end

  describe '#validates' do
    context 'invalid operator' do
      it { expect { object.validates('+') }.to raise_error 'Invalid operator' }
    end
  end
end
