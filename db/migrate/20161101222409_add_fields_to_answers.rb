class AddFieldsToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :category, :string
    add_column :answers, :confidence, :float
  end
end
