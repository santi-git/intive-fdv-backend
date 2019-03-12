class ProcessedOrder
  def initialize(order, discount = nil)
    @order = order
    @discount = discount
  end

  def price
    raise Exception if @order.empty?

    @order.inject(0) { |r1, r2| r1 + r2.price }
  end
end