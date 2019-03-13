require 'rspec'
require_relative '../lib/rental'
require_relative '../lib/undefined_rate_error'

describe Rental do
  it 'throws an error if when rate is not overridden' do
    class MockRental < Rental
    end

    expect {
      MockRental.new(2).price
    }.to raise_error(UndefinedRateError)
  end
end