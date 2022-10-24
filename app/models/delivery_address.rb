class DeliveryAddress < ApplicationRecord
  def address_display
    '〒' + zip_code + ' ' + address + ' ' + name
  end
end
