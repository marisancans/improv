class GalleryImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CloudinaryHelper
  
  def public_id
    gallery_id = model.gallery.id
    user_id = model.gallery.user.id
    gallery_cloudinary_path(user_id, gallery_id) + Cloudinary::Utils.random_public_id;
  end 
  
end
