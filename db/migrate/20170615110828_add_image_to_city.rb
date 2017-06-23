class AddImageToCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :image, :string
  end
end
