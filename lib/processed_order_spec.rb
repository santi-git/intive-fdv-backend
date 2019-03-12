require 'rspec'
require_relative 'processed_order'

describe ProcessedOrder do
  it 'errors if receives and order without items' do
    expect {
      ProcessedOrder.new([]).price
    }.to raise_exception
  end

  it 'receives a rental order and returns the total pricing' do
    order = [
        HourlyRental.new(2),
        DailyRental.new(1),
        WeeklyRental.new(1)
    ]

    processed_order = ProcessedOrder.new(order)

    expect(processed_order.price).to eq(5 * 2 + 20 * 1 + 60 * 1)
  end
end