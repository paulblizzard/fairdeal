class AddDealingRefToWorks < ActiveRecord::Migration[5.0]
  def change
    add_reference :works, :dealing, foreign_key: true
  end
end
