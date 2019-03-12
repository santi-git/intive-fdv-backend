class ProcessedOrder
  def initialize(order)
    @order = order
  end

  def price
    @order.inject(0) { |r1, r2| r1 + r2.price }
  end
end