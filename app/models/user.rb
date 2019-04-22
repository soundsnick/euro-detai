class User < ApplicationRecord
  belongs_to :country
  belongs_to :role
  has_many :commentaries, dependent: :destroy
end
