require 'rspec'
require_relative '../lib/rental_service'
require_relative '../lib/hourly_rental'
require_relative '../lib/daily_rental'
require_relative '../lib/weekly_rental'

describe RentalService do
  it 'should receive a rental order and return total pricing' do
    order = [
        HourlyRental.new(2),
        DailyRental.new(1),
        WeeklyRental.new(1)
    ]

    processed_order = RentalService.process_order(order)

    expect(processed_order.price).to eq(5 * 2 + 20 * 1 + 60 * 1)
  end
end