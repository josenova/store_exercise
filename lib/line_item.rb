class LineItem

  attr_accessor :item, :quantity, :promotion

  def initialize(item, quantity, promotion)
    @item = item
    @quantity = quantity
    @promotion = promotion
  end

  def add
    @quantity += 1
  end

  def substract
    @quantity -= 1
  end

  def subtotal
    @promotion ? (@item.price * @quantity) - discount : @item.price * @quantity # Substract discount if promotion object exists
  end

  private

  def discount
    if @quantity >= @promotion.min_quantity # Promotion applies?
      affected = (@quantity / (1 / @promotion.affected)).to_i # How many items are affected by the promotion
      return affected * (@item.price * @promotion.discount) # Returns the discount total amount
    else
      return 0
    end
  end

end
