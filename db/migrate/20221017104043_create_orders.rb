class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string  :name
      t.string  :zip_code
      t.string  :address
      t.integer :postage
      t.integer :billing_amount
      t.integer :total_payment
      t.integer :status

      t.timestamps
    end
  end
end
