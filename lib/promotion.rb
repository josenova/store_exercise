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
  # The `discount` and `affected` attributes are percentages represented as decimals.

  # For example:

  ## Promotion 2x1
  # Item: "VOUCHER"
  # Min Qty: 2
  # Affected: 0.5 -> Half of the items (divide by 2, get integer)
  # Discount: 1 -> Means the items affected are discounted by 100% (free)


  ## Promotion Bulk
  # Item: "TSHIRT"
  # Min Qty: 3
  # Affected: 1 -> All of the tshirts get price reduction
  # Discount: 0.05 -> The discount is for 1€ since their price is 20.00€

end
