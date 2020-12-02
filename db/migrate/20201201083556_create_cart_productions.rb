class CreateCartProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_productions do |t|
      t.integer :cart_id
      t.integer :production_detail

      t.timestamps
    end
  end
end
