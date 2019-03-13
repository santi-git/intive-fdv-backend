require_relative 'discount'

class FamilyDiscount < Discount
  def self.discount
    0.3
  end

  def self.calculate(total_items, total_price)
    if total_items >= 3 && total_items <= 5
      total_price * discount
    else
      0
    end
  end
end
