class AddDeletedAtToEndUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :end_users, :deleted_at, :datetime
    add_index :end_users, :deleted_at
  end
end
