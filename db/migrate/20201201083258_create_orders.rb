class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, foreign_key: true
      t.integer :order_status
      t.integer :total_price
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
