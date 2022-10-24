class Order < ApplicationRecord
  has_many :order_products
  belongs_to :customer
  enum total_payment: { credit_card: 0, transfer: 1 }


  # def taxin_price
  #   price*1.1
  # end

  # def subtotal
  #   taxin_price * count
  # end

end
