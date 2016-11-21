class AddFactorTypeToFactors < ActiveRecord::Migration[5.0]
  def change
    add_column :factors, :factor_type, :string
  end
end
