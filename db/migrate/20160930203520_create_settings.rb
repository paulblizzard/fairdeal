class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :email_pref
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
