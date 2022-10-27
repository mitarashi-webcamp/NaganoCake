class Order < ApplicationRecord
  has_many :order_products
  belongs_to :customer

  enum total_payment: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, shipped: 4 }

  def address_display
    '〒' + zip_code + ' ' + address + ' ' + name
  end
  
end
