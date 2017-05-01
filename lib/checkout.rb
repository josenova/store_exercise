class Checkout

  attr_accessor :items, :promotions

  # The promotions are stored in the checkout class but are sent and applied inside each individual line item instance

  def initialize(promotions)
    @items = []
    @promotions = promotions # must be an array to allow multiple promotions simultaneously for different items on same checkout
  end

  def scan(code) # Adds one of said item to checkout
    item = ObjectSpace.each_object(Item).find { |i| i.code == code } # ObjectSpace is used to search the created Item instances
    if item
      li = @items.find { |li| li.item.code == item.code } # Is this item already in cart?
      if li
        li.add
        return li # print Line Item in console (not really necessary)
      else
        promotion = @promotions.find { |p| p.item_code == code } # Only allows one promotion per item
        new_line = LineItem.new(item, 1, promotion) # Inject promotion object (or nil). This can be avoided using Rails Active Record associations.
        @items << new_line
        return new_line # return Line Item in console
      end
    end
  end

  def descan(code) # Removes one of said item from checkout
    li = @items.find { |i| i.item.code == code }
    if li
      if li.quantity <= 1
        @items.delete_at(@items.index(li) || @items.length) # Ruby's Garbage Collector will delete unused instances of LineItem
        nil # Print nil in console when line item is deleted
      else
        li.substract
        return li # print Line Item in console
      end
    end
  end

  def total
    format("€%.2f", @items.collect { |x| x.subtotal }.inject(0, :+)) # Sum of subtotals formatted with euro sign. If more currencies are used the Money Gem is recommended
  end


end
