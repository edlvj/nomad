class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :city_id
      t.integer :user_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
