class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :city_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
