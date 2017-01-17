class GalleriesController < ApplicationController

  def index
    @gallery = Gallery.new
    @galleries = current_user.galleries
  end
  
  def show
    @gallery = current_user.galleries.find(params[:id])
    @gallery_image = GalleryImage.new
  end
  
  def create
    @gallery = Gallery.new(gallery_params)
    
    # redirect_to index if @gallery.save
  end

  private
    
    def gallery_params
      params.require(:gallery).permit(:id, :title, :user_id).merge(user_id: current_user.id)
    end
    
end
