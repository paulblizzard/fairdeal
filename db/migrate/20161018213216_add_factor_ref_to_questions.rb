class AddFactorRefToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :factor, foreign_key: true
  end
end
