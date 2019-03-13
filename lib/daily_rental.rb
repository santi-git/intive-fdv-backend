require_relative 'rental'

class DailyRental < Rental
  def self.rate
    20
  end
end
