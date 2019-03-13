require 'rspec'
require_relative '../../lib/discounts/family_discount'

describe FamilyDiscount do
  describe '.calculate' do
    it 'returns discount if amount is between 3 and 5' do
      total_price = 90

      total_items = 5
      expect_discount(total_items, total_price, 27)

      total_items = 4
      expect_discount(total_items, total_price, 27)

      total_items = 3
      expect_discount(total_items, total_price, 27)
    end

    it 'returns 0 when discount does not apply' do
      total_price = 90

      total_items = 1
      expect_discount(total_items, total_price, 0)
    end
  end
end

def expect_discount(total_items, total_price, assertion)
  amount = FamilyDiscount.calculate(total_items, total_price)
  expect(amount).to eq(assertion)
end