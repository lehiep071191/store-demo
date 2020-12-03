class AddFieldsToProductions < ActiveRecord::Migration[6.0]
  def change
    add_column :productions, :description, :string
  end
end
