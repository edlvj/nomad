class CreateFinRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table :fin_requirements do |t|
      t.integer :country_id
      t.string :cost
      t.timestamps
    end
  end
end
