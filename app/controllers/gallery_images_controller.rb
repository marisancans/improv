class GalleryImagesController < ApplicationController
  before_action :find_image, only: [:destroy, :update, :edit]
  before_action :set_gallery

  def create
    validation_response = add_more_images(images_params)
    flash_error(validation_response['errors'])
    flash_notice(validation_response['valid'])
    redirect_to @gallery
  end
  
  def destroy
    respond_to do |format|
      if @image.destroy
        format.js
      else
        flash[:error] = "Failed deleting image"
        redirect_to gallery_path(@image.gallery)
      end
    end
  end

  private
  
  def find_image
    @image = GalleryImage.find(params[:id])
  end

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  # Validation check needed here
  def add_more_images(new_images)
    result = Hash.new
    errors = Array.new
    valid = Array.new

    new_images[:images].each do |image|
      if !@gallery.gallery_images.create(image: image).valid?
        valid << image.original_filename
      else
        errors << image.original_filename
      end
    end
   
    result['errors'] = errors
    result['valid'] = valid
    
    return result
  end
  
  def flash_error(errors)
    if errors.any?
      str = "#{errors.count}#{' error'.pluralize(errors.count)}:\\"
      str << "#{errors.join('\\')}"
      flash[:error] = str << '\\Couldn\'t be uploaded'
    end
  end
  
  def flash_notice(valid)
    if valid.any?
      str = "#{valid.count}#{' image'.pluralize(valid.count)}\\"
      flash[:notice] = str << "#{valid.join('\\')}\\successfully added to gallery"
    end
  end

  def images_params
    params.require(:gallery_images).permit(images: []) # allow nested params as array
  end
end
