class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.integer :order_id, foreign_key: true
      t.integer :production_detail_id, foreign_key: true

      t.timestamps
    end
  end
end
