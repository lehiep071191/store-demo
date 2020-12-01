class CreateProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :productions do |t|
      t.string :name
      t.integer :brand
      t.timestamps
    end
  end
end
