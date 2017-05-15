class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :title
      t.integer :region_id, index: true
      t.timestamps
    end
  end
end
