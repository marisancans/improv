class GalleryImagesController < ApplicationController

  
  # def show

  # end
  
  # def create
  #   @gallery_image = GalleryImage.new(gallery_images_params)
  #   @gallery_image.save
  #   new_gallery_images
  # end

  # private
    
  #   def gallery_images_params
  #     params.require(:gallery_image).permit(:id, :title, :image).merge(gallery_id: params[:gallery_id])
  #   end
  before_action :set_gallery

  def create
    add_more_images(images_params[:gallery_images])
    flash[:error] = "Failed uploading images" unless @gallery.save
    redirect_to :back
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def add_more_images(new_images)
    new_images.each do |image|
      GalleryImage.create(image:image, gallery_id: params[:gallery_id])
    end
  end

  def images_params
    params.require(:gallery).permit({gallery_images: []}) # allow nested params as array
  end
end
