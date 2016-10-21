class ChangeContentToText < ActiveRecord::Migration[5.0]
  def self.up
    change_table :answers do |t|
      t.change :content, :text
    end
  end
  def self.down
    change_table :answers do |t|
      t.change :content, :text
    end
  end
end
