class LocationController < ApplicationController
  def fetch
    @location = params[:location]
    render status: 200, json: @controller.to_json
  end
  
  private
  
    def location_params
      params.require(:location).permit(:longitude, :latitude) # allow nested params as array
    end
  
end
