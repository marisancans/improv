class Gallery < ApplicationRecord
    before_save :capitalize_title_and_description

    has_many :gallery_images, dependent: :destroy
    # accepts_nested_attributes_for :gallery_images, allow_destroy: :true
    belongs_to :user
    
    validates :title, presence: true
    validates :image, presence: true

    mount_uploader :image, ImageUploader
    
    
    def capitalize_title_and_description
      self.title = self.title.humanize
      self.description = self.description.humanize if !self.description.nil?
    end
    
end
