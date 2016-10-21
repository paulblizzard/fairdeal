class RemoveResponseFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_reference :questions, :response, foreign_key: true
  end
end
