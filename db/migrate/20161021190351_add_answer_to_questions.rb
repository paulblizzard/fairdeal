class AddAnswerToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :answer, foreign_key: true
  end
end
