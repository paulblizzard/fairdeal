class AddFactorRefToResponses < ActiveRecord::Migration[5.0]
  def change
    add_reference :responses, :factor, foreign_key: true
  end
end
