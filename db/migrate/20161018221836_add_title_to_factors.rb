class AddTitleToFactors < ActiveRecord::Migration[5.0]
  def change
    add_column :factors, :title, :string
  end
end
