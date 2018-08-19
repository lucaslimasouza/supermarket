#!/usr/bin/env ruby
require './lib/product'
require './lib/checkout'
require './lib/rules/operators.rb'
require './lib/rules/total_percentage_discount.rb'
require './lib/rules/product_discount.rb'

curry_sauce = Product.new(code: '001', name: 'Curry Sauce', price: 1.95)
pizza = Product.new(code: '002', name: 'Pizza', price: 5.99)
t_shirt = Product.new(code: '003', name: 'Men T-Shirt', price: 25.00)

product_discount = ProductDiscount.new(
  code: '002',
  qty: 2,
  discount: 2,
  operator: '>='
)

total_percentage_discount = TotalPercentageDiscount.new(
  threshold: 30,
  discount: 10,
  operator: '>'
)

promotional_rules = [product_discount, total_percentage_discount]

# Test 1  basket => 001,002,003
basket = [curry_sauce, pizza, t_shirt]
checkout = Checkout.new(promotional_rules)

basket.each do |product|
  checkout.scan product
end

puts 'Test 1  basket => 001,002,003'
puts "#{checkout.total} €"

# Test 2  basket => 002,001,002
basket = [pizza, curry_sauce, pizza]
checkout = Checkout.new(promotional_rules)

basket.each do |product|
  checkout.scan product
end

puts 'Test 2  basket => 002,001,002'
puts "#{checkout.total} €"

# Test 2  basket => 002,001,002,003
basket = [pizza, curry_sauce, pizza, t_shirt]
checkout = Checkout.new(promotional_rules)

basket.each do |product|
  checkout.scan product
end

puts 'Test 3  basket => 002,001,002,003'
puts "#{checkout.total} €"
