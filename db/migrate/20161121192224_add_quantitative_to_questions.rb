class AddQuantitativeToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :quantitative, :boolean
  end
end
