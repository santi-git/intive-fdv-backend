require 'rspec'
require_relative 'daily_rental'

describe DailyRental do
  it '#price returns the amount multiplied by the rate' do
    rental1 = DailyRental.new(1)
    expect(rental1.price).to eq(20)

    rental5 = DailyRental.new(5)
    expect(rental5.price).to eq(100)
  end
end