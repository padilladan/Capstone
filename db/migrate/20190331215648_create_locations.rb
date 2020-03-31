class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :location_type_id
      t.text :description
      t.integer :capacity
      t.integer :cap_percent

      t.timestamps
    end
  end
end
