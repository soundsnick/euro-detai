class Part < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :model
  belongs_to :volume
  belongs_to :carcass
  belongs_to :color
  belongs_to :fuel
  has_many :orders
  belongs_to :category
end