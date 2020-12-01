class CreateProductionDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :production_details do |t|
      t.string :color
      t.string :ram
      t.string :rom
      t.integer :production_id, foreign_key: true

      t.timestamps
    end
  end
end
