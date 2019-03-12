require 'rspec'
require_relative 'family_discount'

describe FamilyDiscount do
  describe '.calculate' do
    it 'returns discount if amount is between 3 and 5' do
      total_price = 90
      total_items = 5
      amount      = FamilyDiscount.calculate(total_items, total_price)
      expect(amount).to eq(27)

      total_items = 4
      amount      = FamilyDiscount.calculate(total_items, total_price)
      expect(amount).to eq(27)

      total_items = 3
      amount      = FamilyDiscount.calculate(total_items, total_price)
      expect(amount).to eq(27)
    end

    it 'returns 0 when discount does not apply' do
      total_price = 90
      total_items = 1

      amount = FamilyDiscount.calculate(total_items, total_price)
      expect(amount).to eq(0)
    end
  end
end