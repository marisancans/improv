class LocationController < ApplicationController
  before_action :find_user_by_token
  
  def fetch
    if params[:longitude].present? && params[:latitude].present?
      @location = @current_user.locations.create(location_params) 
      @location.save
      render status: 200, json: @controller.to_json
    else
      @location = Location.last
    end
  end
  
  private
  
    def find_user_by_token
      @current_user = User.find_by(location_token: params[:location_token])
    end
  
    def location_params
      params.permit(:longitude, :latitude) # allow nested params as array
    end
  
end
