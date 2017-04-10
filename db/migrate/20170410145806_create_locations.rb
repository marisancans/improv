class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longtitude, precision: 10, scale: 6
      t.timestamps
    end
  end
end
