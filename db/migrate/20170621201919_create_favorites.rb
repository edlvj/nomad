class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :city_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true
      t.boolean :visited
      t.timestamps
    end
  end
end
