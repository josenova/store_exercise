# Cabify's coding exercise. Code is detailed through commenting.
# Using ruby 2.4.0 exclusively.
# Run with: irb -r ./store.rb
# Author: Jose Raul Nova

require_relative 'lib/item'
require_relative 'lib/checkout'
require_relative 'lib/line_item'
require_relative 'lib/promotion'


# Enumerable Class is included to use Find, Collect methods.
include Enumerable

# Always use BigDecimal when working with money.
require "bigdecimal"


# Load Items in variables so ruby's Garbage Collector doesnt remove unused instances.
@voucher = Item.new('VOUCHER', 'Cabify Voucher', '5.00')
@tshirt = Item.new('TSHIRT', 'Cabify T-Shirt', '20.00')
@mug = Item.new('MUG', 'Cabify Coffee Mug', '7.50')

@promotions = []
@promotions << Promotion.new("VOUCHER", 2, 1, 0.5)
@promotions << Promotion.new("TSHIRT", 3, 0.05, 1)

# co = Checkout.new(promotions)
# co.scan("VOUCHER")
