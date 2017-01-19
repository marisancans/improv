class GalleryImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
  def public_id
    #Cloudinary dynamic folders
    user_id = model.gallery.user.id
    gallery_id = model.gallery.id 
    return "webpage/users/user_#{user_id}/galleries/gallery_#{gallery_id}/" + Cloudinary::Utils.random_public_id;
  end 
  
end
