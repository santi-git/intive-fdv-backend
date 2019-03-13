require_relative 'undefined_rate_error'

class Rental
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def self.rate
    raise UndefinedRateError
  end

  def price
    @amount * self.class.rate
  end
end