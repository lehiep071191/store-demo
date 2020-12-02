class AddDiscountToProductionDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :production_details, :discount, :integer
  end
end
