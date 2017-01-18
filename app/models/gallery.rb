class Gallery < ActiveRecord::Base
    before_save :capitalize_title

    has_many :gallery_images
    belongs_to :user
    
    validates :title, presence: true
    validates :image, presence: true

    mount_uploader :image, ImageUploader
    
    
    def capitalize_title
      self.title = self.title.humanize
    end
    
end
