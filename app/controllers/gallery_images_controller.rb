class GalleryImagesController < ApplicationController

  def show

  end
  
  def create
    @gallery_image = GalleryImage.new(gallery_images_params)
    @gallery_image.save
    flash[:notice] = 'Image successfully added'
    redirect_to @gallery_image.gallery
  end

  private
    
    def gallery_images_params
      params.require(:gallery_image).permit(:id, :title, :image).merge(gallery_id: params[:gallery_id])
    end
    
end
