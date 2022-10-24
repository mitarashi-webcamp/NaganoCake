class Order < ApplicationRecord
  has_many :order_products
  enum total_payment: { credit_card: 0, transfer: 1 }

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
