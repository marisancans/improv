class SubscribedFeedsController < ApplicationController
  before_action :authenticate_user!
    
  def create
    
    respond_to do |format|
      @subscribed_feed = SubscribedFeed.new
      if SubscribedFeed.create(subscribed_feed_params) 
          format.json { render json: @subscribed_feed, status: :updated, location: @subscribed_feed }
          format.js { flash.now[:success] = "Subscribed!" }
      else
        format.json { render json: @subscribed_feed.errors, status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end

  def update
  end

  def destroy
  end
  
  private
  
  def subscribed_feed_params
    params.permit(:feed_id).merge(user_id: current_user.id)
  end
end
