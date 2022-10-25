class OrderProduct < ApplicationRecord
  belongs_to :order

  belongs_to :product
  enum making_status: { cannot_be_manufactured: 0, waiting_for_production: 1, now_production: 2, production_completed: 3 }

end
