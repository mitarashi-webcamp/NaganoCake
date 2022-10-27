class Order < ApplicationRecord
  has_many :order_products
  belongs_to :customer
  validates :tptal_payment, presence: true
  validates :address_id, presence: true
  validates :address_number, presence: true

  enum total_payment: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, shipped: 4 }

  def address_display
    '〒' + zip_code + ' ' + address + ' ' + name
  end

  # def taxin_price
  #   price*1.1
  # end

  # def subtotal
  #   taxin_price * count
  # end

end
