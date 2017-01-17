class GalleryImagesController < ApplicationController

  def show

  end
  
  def create
    @gallery_image = GalleryImage.new(gallery_images_params)
    @gallery_image.save
    
    # redirect_to r if @gallery_image.save
  end

  private
    
    def gallery_images_params
      params.require(:gallery_image).permit(:id, :title, :image).merge(gallery_id: params[:gallery_id])
    end
    
end
