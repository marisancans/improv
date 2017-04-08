class ProfileImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CloudinaryHelper
  
  def public_id
    user_id = model.id
    profile_image_cloudinary_path(user_id);
  end 
  
end
