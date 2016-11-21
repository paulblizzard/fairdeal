class AddDealingToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :dealing, foreign_key: true
  end
end
