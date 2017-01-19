class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  mount_uploader :image, GalleryImageUploader
end
