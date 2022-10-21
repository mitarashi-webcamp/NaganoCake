class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_products
  validates :price, presence: true
end
