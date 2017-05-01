# Cabify's Coding Exercise

This is a coding exercise for Cabify using Ruby v2.4.0 exclusively and Rspec to perform unit tests.

Use `irb -r ./store.rb` on console to run.

Items and pricing rules are already created in `store.rb`. You can start the checkout process like this:
```
co = Checkout.new(@promotions)
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("VOUCHER")
co.total
> "€10.00"
```
As you can see the 2x1 promo is applied. `@promotions` here is an array containing Promotion instances. This way you can load different promotions for different items into the checkout process. 

You can also `co.items` to view all items in cart as well as `descan` items (for lack of a better word) to remove an unwanted item. Continuing the checkout process like this:
```
co.descan("VOUCHER")
co.total
> "€5.00"
```

## Pricing Rules

With this approach we encapsulate pricing rules over a single class (renamed Promotion).

The Promotion class takes 4 parameters: `item_code`, `min_quantity`, `discount` and `affected`. Using this structure we are able to create 2x1, 3x2, bulk discounts, & more using only this class.

When the items meet the `min_quantity` the promotion is triggered. The `discount` and `affected` attributes are percentages represented as decimals.

Examples:
```
# Promotion 2x1

item_code:      "VOUCHER"
min_quantity:   2
affected:       0.5 -> Half of the items (divide by 2, get integer)
discount:       1 -> Means the items affected are discounted by 100% (free)


# Promotion Bulk

item_code:      "TSHIRT"
min_quantity:   3
affected:       1 -> All of the tshirts get price reduction
discount:       0.05 -> The discount is for 1€ since their price is 20.00€
```

This results in flexibility while mantaining lean code.

## Testing

First `gem install rspec` and then use `rspec spec` to run the tests inside the spec folder.
