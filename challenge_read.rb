require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."


#find any product
any_product = Product.first
if any_product
  puts "First product fetched successfully."
else
  puts "Failed to fetch the first product."
end


# puts "The name of my first product is #{any_product[:name]}."
if any_product
  any_product.attributes.each do |column, value|
    puts "#{column}: #{value}"
  end
else
  puts "No products found in the database."
end

#Total number of products
number_of_products = Product.count
puts "Total Number of Products: #{number_of_products}"

#names of all products above $10 with names that begin with the letter C
product_names = Product.where('price > ? AND name LIKE ?', 10, 'C%')

puts "Products priced above $10 with names starting with 'C':"
product_names.each do |product|
  puts product.name
end

#Total number of products with a low stock quantity
product_count = (Product.where('stock_quantity < 5')).count
puts "Total number of products with a low stock quantity: #{product_count}"

# #finding ram
# ram = Product.where(name: 'Ram').first

# puts ram.inspect

#finding the name of category associated with garri product

zobo_product = Product.find_by(id: 233)

zobo_product_category = zobo_product.category

puts "Product #{zobo_product.name} belongs to  #{zobo_product_category.name} category."

puts zobo_product_category.name


#Find a specific category and use it to build and persist a new product associated with this category.

known_category = Category.find(3)

puts "#{known_category.name}" #confections

new_product = known_category.products.build( name:  "Strawberry muffins",
                                          description: "6 cups in a pack",
                                          price: 4.5,
                                          stock_quantity: 30)
new_product.save

puts new_product.inspect

#Find a specific category and then use it to locate all the the associated products over a certain price.
found_category = Category.find(4)
puts "#{found_category.name}" #Diary Products.

price_limit = 20.0
expensive_products = found_category.products.where('price > ?', price_limit)

if expensive_products.any?
puts "Products in #{found_category.name} category over $#{price_limit}:"
  expensive_products.each do |product|
    puts "Product Name: #{product.name}, Price: #{product.price}"
  end
else
  puts "No products in #{found_category.name} category are over $#{price_limit}."
end
