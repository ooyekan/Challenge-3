require_relative 'ar.rb'

# Method One: Create a product in "object space"

new_product = Product.new

# Set the required properties.
new_product.name  = "Ram"
new_product.description = "male sheep"
new_product.price  = 50.0
new_product.stock_quantity = 5
new_product.category_id = 6

new_product.save


if new_product.save
  puts "Product saved successfully"
else
  puts "Failed to save product"
end

puts new_product.inspect

## Method Two: Create a product in "object space"
# This time we set the required properties as key/value arguments of the new method.

zobo = Product.new( name:  "Hibiscus Drink",
                    description: "Made with Dried Hibiscus flower",
                    price: 5.0,
                    stock_quantity: 50,
                    category_id: 1 )

zobo.save

puts zobo.inspect

## Method Two: Create the object and persist it all at once

garri = Product.create( name:  "Cassava Flakes",
                    description: "Made from cassava root",
                    price: 12.99,
                    stock_quantity: 30,
                    category_id: 4 )

puts garri.inspect


#attempt to save incomplete column in database

akara = Product.new( name: "Beans cake" ) # Purposefully missing the city and email.

# Save will return false if any of our validations fail.
if (akara.save)
  puts "akara was saved to the database products table."
  puts akara.inspect
else
  puts "There was an error saving akara to the database."
  akara.errors.full_messages.each do |message|
    puts "- #{message}"
  end
end
