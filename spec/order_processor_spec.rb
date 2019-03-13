require 'rspec'
require_relative '../lib/order_processor'
require_relative '../lib/hourly_rental'
require_relative '../lib/daily_rental'
require_relative '../lib/weekly_rental'
require_relative '../lib/family_discount'
require_relative '../lib/no_items_in_order_error'


describe OrderProcessor do
  msg = 'The order must have at least 1 item'

  it 'errors if receives and order without items' do
    expect {
      OrderProcessor.new([])
    }.to raise_error(NoItemsInOrderError, msg)
  end

  it 'receives a rental order and returns the total pricing' do
    order = [
        HourlyRental.new(2),
        DailyRental.new(1),
        WeeklyRental.new(1)
    ]

    processed_order = OrderProcessor.new(order)
    expect(processed_order.price).to eq(
        HourlyRental.rate * 2 +
        DailyRental.rate * 1 +
        WeeklyRental.rate * 1
    )
  end

  it 'totals items correctly' do
    order = [HourlyRental.new(5)]
    processed_order1 = OrderProcessor.new(order)

    expect(processed_order1.items).to eq(5)

    order2 = [
        HourlyRental.new(5),
        DailyRental.new(2)
    ]
    processed_order2 = OrderProcessor.new(order2)

    expect(processed_order2.items).to eq(7)
  end

  it 'applies a discounts when valid' do
    max_order = [HourlyRental.new(5)]

    processed_order = OrderProcessor.new(max_order, [
        FamilyDiscount
    ])

    expect(processed_order.discount).not_to eq(0)
    expect(processed_order.discount).to eq(processed_order.price * FamilyDiscount.discount)
  end

  it 'does not apply discounts when invalid' do
    order = [HourlyRental.new(1)]

    processed_order = OrderProcessor.new(order, [
        FamilyDiscount
    ])

    expect(processed_order.discount).to eq(0)
  end
end