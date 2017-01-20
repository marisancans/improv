class GalleriesController < ApplicationController
  include CloudinaryHelper
  before_action :authenticate_user!
  
  def index
    @gallery = Gallery.new
    @galleries = current_user.galleries.order(created_at: :desc)
  end
  
  def show
    @gallery = current_user.galleries.find(params[:id])
    @gallery_image = GalleryImage.new
  end
  
  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:notice] = 'Gallery successfully created'
      redirect_to @gallery
    else
      flash[:error] = @gallery.errors.full_messages
      redirect_to galleries_path
    end
  end
  
  def destroy
    @gallery = current_user.galleries.find(params[:id])
    gallery_id = @gallery.id
    user_id = current_user.id
    
    if @gallery.destroy
      
      respond_to do |format|
        format.js
      end
      
      Cloudinary::Api.delete_resources_by_prefix(gallery_cloudinary_path(user_id, gallery_id))
      delete_cloudinary_user_gallery_folder(user_id, gallery_id)

      else
        if @gallery.errors.full_messages.any?
          flash[:error] = @gallery.errors.full_messages
        else 
          flash[:error] = 'Error, something went wrong'
          redirect_to galleries_path
        end
        
    end

  end

  private
  
    def delete_cloudinary_user_gallery_folder(user_id, gallery_id)
      folder_path = gallery_cloudinary_path(user_id, gallery_id)
      api_key = ENV['cloudinary_api_key'] 
      api_secret = ENV['cloudinary_api_secret']
      cloud_name = ENV['cloudinary_cloud_name']
      url = "https://#{api_key}:#{api_secret}@api.cloudinary.com/v1_1/#{cloud_name}/folders/#{folder_path}"
      response = HTTParty.delete(url)
      puts response.body, response.code, response.message, response.headers.inspect
      puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    end
    
    def gallery_params
      params.require(:gallery).permit(:id, :title, :image).merge(user_id: current_user.id)
    end
    
end
