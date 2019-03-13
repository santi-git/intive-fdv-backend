require 'rspec'
require_relative '../../lib/discounts/discount'
require_relative '../../lib/errors/method_not_overridden_error'

describe Discount do
  it 'errors if .discount or .calculate are not overridden' do
    class MockDiscount < Discount
    end

    expect {
      MockDiscount.discount
    }.to raise_error(MethodNotOverriddenError)

    expect {
      MockDiscount.calculate(4, 50)
    }.to raise_error(MethodNotOverriddenError)
  end
end