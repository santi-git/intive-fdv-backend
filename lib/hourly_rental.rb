require_relative 'rental'

class HourlyRental < Rental
  def self.rate
    5
  end
end