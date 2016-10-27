class AddConfidenceAndCategoryToDealings < ActiveRecord::Migration[5.0]
  def change
    add_column :dealings, :confidence, :double
    add_column :dealings, :category, :string
  end
end
