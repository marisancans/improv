module CloudinaryHelper
  def gallery_cloudinary_path(user_id, gallery_id)
    return "webpage/users/user_#{user_id}/galleries/gallery_#{gallery_id}/";
  end
end
