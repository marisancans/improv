class Gallery < ActiveRecord::Base
    has_many :gallery_images
    belongs_to :user
    
    validates :title, presence: true
    validates :image, presence: true

    mount_uploader :image, ImageUploader
end
