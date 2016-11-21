class AddDecidedByToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :category_decided_by, :string
  end
end
