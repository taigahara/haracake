class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :amount
      t.integer :at_order_time_price
      t.integer :production_status, default: 0

      t.timestamps
    end
  end
end
