class Query < ApplicationRecord
  belongs_to :fuel
  belongs_to :manufacturer
  belongs_to :carcass
  has_many :query_images
end
