require_relative 'rental'

class WeeklyRental < Rental
  def self.rate
    60
  end
end