require_relative 'ar.rb'

Faker::UniqueGenerator.clear
#Generate 10 new categories
10.times do
  new_category_name = Faker::Commerce.unique.department(1)

  new_category = Category.create(name: new_category_name)

  puts "Created category: #{new_category.name}"

  # Generate 10 new products for each category
  10.times do
    new_product = new_category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      stock_quantity: Faker::Number.between(1,100)
    )
    puts "  Created product in category #{new_category.name}: #{new_product.name}"
    puts "    Description: #{new_product.description}"
    puts "    Price: $#{new_product.price}"
    puts "    Stock Quantity: #{new_product.stock_quantity}"
    end
end


# time_limit = 120.minutes.ago

# # Fetch and delete categories created within the last time_limit
# recent_categories = Category.where('created_at > ?', time_limit)

# recent_categories.each do |category|
#   puts "Deleting category: #{category.name}"
#   category.destroy
# end

# puts "Deleted #{recent_categories.size} categories."
