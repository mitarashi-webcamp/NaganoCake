class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_products
  validates :name, presence: true
  validates :note, presence: true
  validates :price, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image
  end

  def add_tax_price
    (self.price*1.10).round
  end
end
