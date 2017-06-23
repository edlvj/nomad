class ChangeRateTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :ratings, :quality_life, :integer
    remove_column :ratings, :fun, :integer
    remove_column :ratings, :safe, :integer
    remove_column :ratings, :toward, :integer
    
    add_column :ratings, :rate_type, :string
    add_column :ratings, :rate, :integer, default: 3

  end
end
