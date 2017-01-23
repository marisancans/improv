class PicturesController < ApplicationController

  def index
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(picture_params)
    
    redirect_to index if @picture.save
  end

  private
    
    def picture_params
      params.require(:picture).permit(:id, :title, :pictures_url, :gallery_id)
    end
end
