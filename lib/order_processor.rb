require_relative 'errors/no_items_in_order_error'

# Public: In charge of receiving rental orders and applying discounts
# to provide the final pricing.
#
# Examples
#
#   order = OrderProcessor.new(
#     [HourlyRental.new(2)],
#     [FamilyDiscount, ChristmasDiscount]
#   )
#
#   order.price
#   order.discount
class OrderProcessor
  attr_accessor :price, :items

  # Public: Initialize an OrderProcessor
  #
  # order - An Array of Rental subclasses
  # discounts - An optional array of Discount classes (default: nil)
  def initialize(order, discounts = nil)
    raise NoItemsInOrderError if order.empty?

    @order     = order
    @discounts = discounts

    @items = total_items
    @price = total_price
  end

  # Public: Returns the total discount as an Integer
  # applied to an order based on the +discounts+ parameter
  # received.
  def discount
    @discounts.sum { |d| d.calculate @items, @price }
  end

  private

  def total_price
    @order.sum(&:price)
  end

  def total_items
    @order.sum(&:amount)
  end
end