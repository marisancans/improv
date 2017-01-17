class Gallery < ActiveRecord::Base
    has_many :gallery_images
    belongs_to :user
end
