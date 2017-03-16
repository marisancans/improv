class GalleryImage < ApplicationRecord
  belongs_to :gallery
  mount_uploader :image, GalleryImageUploader
  validates :image, presence: true
end
