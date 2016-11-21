class AddTypeToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :question_type, :string
  end
end
