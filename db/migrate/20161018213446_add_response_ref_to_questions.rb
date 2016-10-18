class AddResponseRefToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :response, foreign_key: true
  end
end
