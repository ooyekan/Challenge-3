class Product < ActiveRecord::Base
  # This AR object is linked with the products table.

  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.

  #Columns validation
  validates :name, presence: { message: "cannot be blank" },
                  uniqueness: { message: "must be unique" },
            length: { minimum: 3 , too_short: "%{count} characters is the minimum allowed" }
  validates :description, presence: { message: "cannot be blank" }
  validates :price, presence: { message: "cannot be blank" }
  validates :stock_quantity, presence: { message: "cannot be blank" }

  belongs_to :category

  # Columns in the products table:
  # id, name, description, price, stock_quantity, category_id, created_at, updated_at


end

#The products table has an association with the category table because it contains category_id
#and also has belongs_to: category in it's class.
