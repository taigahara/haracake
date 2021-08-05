class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :ship_name
      t.string :ship_address
      t.string :postal_code
      
      t.timestamps
    end
  end
end
