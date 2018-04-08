class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :topic_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.text :text 
      t.timestamps
    end
  end
end
