class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.string :introdution
      t.string :image_id
      t.integer :price
      t.boolean :is_sale, default: true

      t.timestamps
    end
  end
end
