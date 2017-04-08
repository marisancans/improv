module CloudinaryHelper
  def gallery_cloudinary_path(user_id, gallery_id)
    return "webpage/users/user_#{user_id}/galleries/gallery_#{gallery_id}/#{ Cloudinary::Utils.random_public_id }";
  end
  
  def profile_image_cloudinary_path(user_id)
    return "webpage/users/user_#{user_id}/profile_image/#{ Cloudinary::Utils.random_public_id }";
  end
  
end
