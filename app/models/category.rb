class Category < ApplicationRecord
  has_many :parts
  has_many :subcategories
end
