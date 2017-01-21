class GalleriesController < ApplicationController
  include CloudinaryHelper
  before_action :authenticate_user!
  before_action :find_gallery, only: [:show, :destroy, :update, :edit]
  before_action :initialize_gallery, only: [:index]
  
  def index
    @galleries = current_user.galleries.order(created_at: :desc)
  end
  
  def show
    @gallery_image = GalleryImage.new
    @gallery_images = @gallery.gallery_images.order(created_at: :desc)
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
  
  def edit
    respond_to do |format|
      format.js
    end
  end
  
  def update
    if @gallery.update_attributes(gallery_params)
      flash[:notice] = 'Gallery successfully updated'
      redirect_to galleries_path
    else
      flash[:error] = @gallery.errors.full_messages
      redirect_to galleries_path
    end
  end

  private
  
    def find_gallery
      @gallery = current_user.galleries.find(params[:id])
    end
    
    def initialize_gallery
      @gallery = Gallery.new
    end    
  
    def delete_cloudinary_user_gallery_folder(user_id, gallery_id)
      folder_path = gallery_cloudinary_path(user_id, gallery_id)
      api_key = ENV['cloudinary_api_key'] 
      api_secret = ENV['cloudinary_api_secret']
      cloud_name = ENV['cloudinary_cloud_name']
      url = "https://#{api_key}:#{api_secret}@api.cloudinary.com/v1_1/#{cloud_name}/folders/#{folder_path}"
      response = HTTParty.delete(url)
      puts response.body
    end
    
    def gallery_params
      params.require(:gallery).permit(:id, :title, :image).merge(user_id: current_user.id)
    end
    
end
