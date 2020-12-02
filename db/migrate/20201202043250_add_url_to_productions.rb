class AddUrlToProductions < ActiveRecord::Migration[6.0]
  def change
    add_column :productions, :url, :string
  end
end
