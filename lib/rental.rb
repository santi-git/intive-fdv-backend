require_relative 'undefined_rate_error'

class Rental
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def rate
    raise UndefinedRateError
  end

  def price
    @amount * rate
  end
end