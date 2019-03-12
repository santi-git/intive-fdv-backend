require_relative 'processed_order'

# Abstracts the rental pricing logic giving a clear interface
class RentalService
  def self.process_order(order)
    ProcessedOrder.new(order)
  end
end