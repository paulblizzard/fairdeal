class AddEmailToDealings < ActiveRecord::Migration[5.0]
  def change
    add_column :dealings, :email, :string
  end
end
