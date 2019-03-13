require_relative '../errors/method_not_overridden_error'

# Public: documents the Discount interface and controls
# the consistency in Discount subclassing by requiring
# the .discount and .calculate methods.
class Discount
  def self.discount
    raise MethodNotOverriddenError
  end

  # Public: returns the discount and receives the +total_items+
  # and +total_price+ in the order to use for the calculation.
  # Use of them is not mandatory.
  #
  # total_price - An Integer representing the total items in the
  #               the order.
  # total_price - An Integer representing the total price of the
  #               order.
  #
  # TODO: there is room for improvement, maybe passing directly
  # the +order+ to .calculate to allow major flexibility. This
  # could reduce the clarity or expressiveness of the method's
  # interface.
  def self.calculate(total_items, total_price)
    raise MethodNotOverriddenError
  end
end