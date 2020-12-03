class AddFieldsToProductionDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :production_details, :quantity, :integer
  end
end
