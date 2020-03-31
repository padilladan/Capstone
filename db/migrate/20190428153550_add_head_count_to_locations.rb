class AddHeadCountToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :headcount, :integer
  end
end
