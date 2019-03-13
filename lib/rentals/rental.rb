require_relative '../errors/undefined_rate_error'

# Public: Encapsulates basic Rental logic
class Rental
  attr_accessor :amount

  # Public: receives the amount of items for the
  # kind of rental.
  #
  # amount - An integer representing the amount of
  # items included for this rental.
  def initialize(amount)
    @amount = amount
  end

  # Public: The rate for each item applied to this rental.
  # Raises an UndefinedRateError if subclasses don't override.
  def self.rate
    raise UndefinedRateError
  end

  # Public: Contains the pricing logic for a rental. A rental
  # subclass can decide to override completely or simply define
  # a custom rate.
  #
  # Returns an Integer representing the price.
  def price
    @amount * self.class.rate
  end
end