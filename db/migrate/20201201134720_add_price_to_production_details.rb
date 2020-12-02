class AddPriceToProductionDetails < ActiveRecord::Migration[6.0]
  def change
  	 add_column :production_details, :price, :integer
  end
end
