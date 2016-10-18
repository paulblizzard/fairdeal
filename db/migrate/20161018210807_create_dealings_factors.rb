class CreateDealingsFactors < ActiveRecord::Migration[5.0]
  def change
    create_table :dealings_factors, id: false do |t|
      t.references :dealing, foreign_key: true
      t.references :factor, foreign_key: true
    end
  end
end
