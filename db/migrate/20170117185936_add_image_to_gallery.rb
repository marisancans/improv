class AddImageToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :image, :string
  end
end
