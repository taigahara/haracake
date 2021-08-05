class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :payment_method, default: 0
      t.integer :freight
      t.integer :total_price
      t.string :ship_name
      t.string :ship_address
      t.string :postal_code
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
