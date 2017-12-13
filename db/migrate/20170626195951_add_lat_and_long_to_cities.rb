class AddLatAndLongToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :lat, :decimal, :precision => 15, :scale => 10
    add_column :cities, :long, :decimal, :precision => 15, :scale => 10
  end
end
