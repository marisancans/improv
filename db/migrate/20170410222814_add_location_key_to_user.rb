class AddLocationKeyToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :location_key, :string
  end
end
