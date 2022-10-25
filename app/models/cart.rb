class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  
  # def taxin_price
  # end  
  # def sum_price
  #   product.taxin_price*product_count
  # end
end
