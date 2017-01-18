class GalleriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @gallery = Gallery.new
    @galleries = current_user.galleries.order(created_at: :asc)
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
      flash.now[:notice] = "Message is available in same request-response cycle"
    end
  end

  private
    
    def gallery_params
      params.require(:gallery).permit(:id, :title, :image).merge(user_id: current_user.id)
    end
    
end
