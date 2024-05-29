require_relative 'ar.rb'

update_stock_quantity = Product.where('stock_quantity > 40')

puts "Products with stock quantity above 40:"
update_stock_quantity.each do |product|
  puts "Product Name: #{product.name}, Stock Quantity: #{product.stock_quantity}"
end

#update stock quantity by adding 1 and save

update_stock_quantity.each do |product|
  product.stock_quantity += 1
  product.save
end

puts "Products with stock quantity above 40 after adding 1:"
update_stock_quantity.each do |product|
  puts "Product Name: #{product.name}, Stock Quantity: #{product.stock_quantity}"
end
