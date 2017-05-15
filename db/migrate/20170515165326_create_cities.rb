class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :title
      t.integer :country_id, index: true
      t.timestamps
    end
  end
end
