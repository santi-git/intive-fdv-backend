class FamilyDiscount
  def self.discount
    0.3
  end

  def self.calculate(total_items, total_price)
    return total_price * discount if total_items >= 3 && total_items <= 5

    0
  end
end
