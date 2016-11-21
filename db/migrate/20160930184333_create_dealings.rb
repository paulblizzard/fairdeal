class CreateDealings < ActiveRecord::Migration[5.0]
  def change
    create_table :dealings do |t|
      t.date :due_date

      t.timestamps
    end
  end
end
