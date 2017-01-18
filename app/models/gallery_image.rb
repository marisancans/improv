class GalleryImage < ActiveRecord::Base
  belongs_to :gallery, dependent: :destroy
  mount_uploader :image, ImageUploader
end
