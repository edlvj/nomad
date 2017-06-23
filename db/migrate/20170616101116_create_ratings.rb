class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :city_id
      t.integer :quality_life, default: 3
      t.integer :fun, default: 3
      t.integer :safe, default: 3
      t.integer :toward, default: 3
      t.timestamps
    end
  end
end
