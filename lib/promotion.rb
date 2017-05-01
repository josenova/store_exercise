class Promotion

  attr_accessor :item_code, :min_quantity, :discount, :affected

  def initialize(item_code, min_quantity, discount, affected)
   @item_code = item_code
   @min_quantity = min_quantity
   @discount = discount
   @affected = affected
  end

  # This class contains the pricing rules (renamed promotions).
  # Using this structure we are able to create 2x1, 3x2, bulk discounts, & more using only this class.

  # For example:

  ## Promotion 2x1
  # Item: VOUCHER
  # Min Qty: 2
  # Affected: 50% -> Half of the items (divide by 2, get integer)
  # Discount: 100% -> Means the items affected are free


  ## Promotion Bulk
  # Item: TSHIRT
  # Min Qty: 3
  # Affected: 100% -> All of the tshirts get price reduction
  # Discount: 5% -> The discount is for 1€ since their price is 20.00€

end
