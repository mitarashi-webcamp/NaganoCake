class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|

      t.integer :order_id
      t.integer :product_id
      t.integer :price
      t.integer :count
      t.integer :making_status, null: false, default: 0

      t.timestamps
    end
  end
end
