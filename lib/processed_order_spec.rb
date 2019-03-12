require 'rspec'
require_relative 'processed_order'
require_relative 'hourly_rental'
require_relative 'daily_rental'
require_relative 'weekly_rental'
require_relative 'family_discount'
require_relative 'no_items_in_order_error'


describe ProcessedOrder do
  msg = 'The order must have at least 1 item'
  it 'errors if receives and order without items' do
    expect {
      ProcessedOrder.new([])
    }.to raise_error(NoItemsInOrderError, msg)
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

  it 'totalizes items correctly' do
    order             = [HourlyRental.new(5)]
    processed_order_1 = ProcessedOrder.new(order)

    expect(processed_order_1.items).to eq(5)

    order_2           = [
        HourlyRental.new(5),
        DailyRental.new(2)
    ]
    processed_order_2 = ProcessedOrder.new(order_2)

    expect(processed_order_2.items).to eq(7)
  end

  it 'applies a discounts when valid' do
    max_order = [HourlyRental.new(5)]

    processed_order = ProcessedOrder.new(max_order, [
        FamilyDiscount
    ])

    expect(processed_order.discount).not_to eq(0)
    expect(processed_order.discount).to eq(processed_order.price * FamilyDiscount.discount)
  end

  it 'does not apply discounts when invalid' do
    order = [HourlyRental.new(1)]

    processed_order = ProcessedOrder.new(order, [
        FamilyDiscount
    ])

    expect(processed_order.discount).to eq(0)
  end
end