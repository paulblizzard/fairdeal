class AddContentToFactors < ActiveRecord::Migration[5.0]
  def change
    add_column :factors, :content, :string
  end
end
