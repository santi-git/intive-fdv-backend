require_relative 'no_items_in_order_error'

class OrderProcessor
  attr_accessor :price, :items

  def initialize(order, discounts = nil)
    raise NoItemsInOrderError if order.empty?

    @order     = order
    @discounts = discounts

    @items = total_items
    @price = total_price
  end

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