class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :format
      t.date :pub_date
      t.integer :pages

      t.timestamps
    end
  end
end
