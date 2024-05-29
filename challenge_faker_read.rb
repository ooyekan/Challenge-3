require_relative 'ar.rb'

all_categories = Category.all

# Iterate over each category
all_categories.each do |category|
  puts "#{category.name}:"

 # Iterate over each product associated with the current category
 category.products.each do |product|
  puts "  #{product.name} - $#{product.price}"
end

puts
end
