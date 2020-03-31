class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.string :name
      t.integer :price
      t.integer :special_type_id
      t.integer :location_id
      t.string :day
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
