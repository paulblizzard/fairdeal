class AddStatusToDealings < ActiveRecord::Migration[5.0]
  def change
    add_column :dealings, :status, :string
  end
end
