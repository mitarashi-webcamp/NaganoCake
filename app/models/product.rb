class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_products
  validates :price, presence: true

  def add_tax_price
    (self.price*1.10).round
  end
end
