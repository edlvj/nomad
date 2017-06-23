class AddEngToCityAndCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :title_eng, :string
    add_column :countries, :title_eng, :string
  end
end
