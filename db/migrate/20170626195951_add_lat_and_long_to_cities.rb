class AddLatAndLongToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :lat, :decimal, :precision => 15, :scale => 13
    add_column :cities, :long, :decimal, :precision => 15, :scale => 13
  end
end
