class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :title
      t.text :content
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
